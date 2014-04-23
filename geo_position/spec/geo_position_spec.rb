require 'rspec/autorun'

require_relative '../lib/geo_position.rb'

describe GeoPosition do
  A28_LAT = 59.9136707
  A28_LON = 10.7420218

  describe "#initialize" do
    context "when given two arguments" do
      it "should raise an error" do
        expect { GeoPosition.new(A28_LAT, A28_LON) }.to raise_error
      end
    end

    context "when given one hash" do
      it "should initialize an instance of GeoPosition" do
        coordinates = GeoPosition.new(
          lat: A28_LAT,
          lon: A28_LON
        )

        coordinates.lat.should == A28_LAT
        coordinates.lon.should == A28_LON
      end

      it "should cast non-nil value to float" do
        coordinates = GeoPosition.new(
          lat: A28_LAT.to_s,
          lon: A28_LON.to_s
        )

        coordinates.lat.should be_a_kind_of(Float)
        coordinates.lon.should be_a_kind_of(Float)
      end

      it "should keep nil values" do
        coordinates = GeoPosition.new(
          lat: nil,
          lon: nil
        )

        coordinates.lat.should be_nil
        coordinates.lon.should be_nil
      end
    end
  end

  describe "#==" do
    it "should return true for objects with the same lon and lat" do
      coordinates = [
        GeoPosition.new(lat: A28_LAT, lon: A28_LON),
        GeoPosition.new(lat: A28_LAT, lon: A28_LON)
      ]

      coordinates.first.should == coordinates.last
    end

    it "should return false for objects without the same lon or lat" do
      coordinates = [
        GeoPosition.new(lat: A28_LAT, lon: A28_LON),
        GeoPosition.new(lat: A28_LAT, lon: A28_LON + 1)
      ]

      coordinates.first.should_not == coordinates.last
    end
  end

  describe "#mongoize" do
    it "should return a hash of lon and lat" do
      coordinates = GeoPosition.new(lat: A28_LAT, lon: A28_LON)

      coordinates.mongoize.should == {
        'lat' => A28_LAT,
        'lon' => A28_LON
      }
    end
  end

  describe "::demongoize" do
    it "should create an instance of GeoPosition from the value as it stored in MongoDB" do
      coordinates = GeoPosition.demongoize(
        'lat' => A28_LAT,
        'lon' => A28_LON
      )

      coordinates.should == GeoPosition.new(lat: A28_LAT, lon: A28_LON)
    end
  end

  describe "::mongoize" do
    it "should create a value as it is stored in MongoDB from a hash" do
      mongo_value = GeoPosition.mongoize(
        :lat => A28_LAT,
        :lon => A28_LON
      )

      mongo_value.should == {
        'lat' => A28_LAT,
        'lon' => A28_LON
      }
    end

    it "should create a value as it is stored in MongoDB from an instance of GeoPosition" do
      mongo_value = GeoPosition.mongoize(GeoPosition.new(lat: A28_LAT, lon: A28_LON))

      mongo_value.should == {
        'lat' => A28_LAT,
        'lon' => A28_LON
      }
    end

    it "should return any other type of objects" do
      object_of_other_type = "other object"

      mongo_value = GeoPosition.mongoize(object_of_other_type)

      mongo_value.should == object_of_other_type
    end
  end

  describe "::evolve" do
    it "should create a value as it is stored in MongoDB from an instance of GeoPosition" do
      mongo_value = GeoPosition.evolve(GeoPosition.new(lat: A28_LAT, lon: A28_LON))

      mongo_value.should == {
        'lat' => A28_LAT,
        'lon' => A28_LON
      }
    end

    it "should return any other type of objects" do
      object_of_other_type = "other object"

      mongo_value = GeoPosition.evolve(object_of_other_type)

      mongo_value.should == object_of_other_type
    end
  end

  describe "#empty?" do
    context "with non-nil lat and lon" do
      it "should return false" do
        coordinates = GeoPosition.new(lat: A28_LAT, lon: A28_LON)

        coordinates.empty?.should be_false
      end
    end

    context "with nil for lat or lon" do
      it "should return true" do
        coordinates = GeoPosition.new(lat: nil, lon: A28_LON)

        coordinates.empty?.should be_true
      end
    end
  end
end
