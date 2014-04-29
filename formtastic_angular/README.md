Formtastic Angular
==================

formtastic_angular offers a form builder for formtastic which creates forms that
adhere to some angular principles.

## Usage

formtastic_angular merely modifies formtastic and does not change how it is
used. It does however somewhat change its output.

```haml
= angular_form_for 'user' do |f|
  = f.input :email
  = f.input :password
  = f.input :password_confirmation

  = f.submit
```

This creates the following HTML.

```html
<form accept-charset="UTF-8" action="/templates/devise/registrations/new"
class="formtastic user" data-ng-submit=
"$event.preventDefault(); user_submit()" method="post" novalidate=
"novalidate">
    <div style="display:none">
        <input name="utf8" type="hidden" value="✓"><input name=
        "authenticity_token" type="hidden" value=
        "vSTwS/+Vsa23y4cEaL6qcplXJ06iyQJNdAsm3PRKnA8=">
    </div>

    <ul>
        <li class="string input required stringish" id="user_email_input">
            <label class=" label" for="user_email">Email<abbr title=
            "required">*</abbr></label><input data-ng-model="user.email"
            id="user_email" name="user[email]" type="text">

            <p class="inline-errors" data-ng-show=
            "user.errors.email.length > 0">{{user.errors.email.join(', ')}}</p>
        </li>

        <li class="password input required stringish" id=
        "user_password_input">
            <label class=" label" for="user_password">Password<abbr title=
            "required">*</abbr></label><input data-ng-model="user.password"
            id="user_password" name="user[password]" type="password">

            <p class="inline-errors" data-ng-show=
            "user.errors.password.length > 0">
            {{user.errors.password.join(', ')}}</p>
        </li>

        <li class="password input required stringish" id=
        "user_password_confirmation_input">
            <label class=" label" for="user_password_confirmation">Password
            confirmation<abbr title=
            "required">*</abbr></label><input data-ng-model=
            "user.password_confirmation" id="user_password_confirmation"
            name="user[password_confirmation]" type="password">

            <p class="inline-errors" data-ng-show=
            "user.errors.password_confirmation.length > 0">
            {{user.errors.password_confirmation.join(', ')}}</p>
        </li>

        <li style="list-style: none"><input name="commit" type="submit"
        value="Save User"></li>
    </ul>
</form>
```

Notice that preventDefault will be invoked upon submitting the form, along with
user_submit. The lastly mentioned method should be defined in some controller.
Within that controller one will also have access to a `user` variable, which
contains the form data. The `user` variable can also be used to show errors in
the form.

```coffee
@RegistrationsCtrl = ($scope, $location, Restangular) ->
  Restangular.setRequestSuffix('.json');

  $scope.user_submit = ->
    delete $scope.user['errors']

    Restangular.service('users').post({ user: $scope.user }).then((returned_data) ->
      if returned_data.status
        $scope.$emit('user.sign_in')
        $location.path('/')
      else
        $scope.user.errors = returned_data.errors # { "email": [ "can't be blank" ] }
    )

@RegistrationsCtrl.$inject = ['$scope', '$location', 'Restangular']
```

The corresponding Rails controller might look like this.

```ruby
class RegistrationsController < ApplicationController
  def create
    user = User.new user_params

    if user.save
      sign_in(user)
      render json: { status: true }
    else
      render json: { status: false, errors: user.errors }
    end
  end

  private

  def user_params
    params.required(:user).permit(:email, :password, :password_confirmation)
  end
end
```
