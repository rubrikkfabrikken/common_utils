unless Object.instance_methods.include?(:try)
  class Object
    def try(*a, &b)
      if a.empty? && block_given?
        yield self
      else
        public_send(*a, &b) if respond_to?(a.first)
      end
    end
  end
end

class GeoPosition
  attr_reader :lat, :lon

  def initialize(*args)
    if Hash === args.first
      @lat = nil_or_float(args.first[:lat])
      @lon = nil_or_float(args.first[:lon])
    else
      raise <<-ERR.strip
Implicit ordering of latitude and longitude is not allowed!

Please instantiate GeoPosition using a hash.

  GeoPosition.new(
    lat: 59.9136707,
    lon: 10.7420218
  )
      ERR
    end
  end

  def ==(other)
    lat.eql?(other.lat) && lon.eql?(other.lon)
  end

  # Converts an object of this instance into a database friendly value.
  def mongoize
    {
      'lat' => @lat,
      'lon' => @lon
    }
  end

  private

  def nil_or_float(value)
    if value.nil?
      value
    else
      value.to_f
    end
  end

  class << self
    # Get the object as it was stored in the database, and instantiate
    # this custom class from it.
    def demongoize(object)
      GeoPosition.new(lat: object.try(:[], 'lat'), lon: object.try(:[], 'lon'))
    end

    # Takes any possible object and converts it to how it would be
    # stored in the database.
    def mongoize(object)
      case object
      when GeoPosition then object.mongoize
      when Hash then GeoPosition.new(lat: object[:lat], lon: object[:lon]).mongoize
      else object
      end
    end

    # Converts the object that was supplied to a criteria and converts it
    # into a database friendly form.
    def evolve(object)
      case object
      when GeoPosition then object.mongoize
      else object
      end
    end
  end
end