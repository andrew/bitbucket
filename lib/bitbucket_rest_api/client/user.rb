# encoding: utf-8

module BitBucket
  class Client::User < API
    @version = '1.0'

    DEFAULT_USER_OPTIONS = {
        "first_name"      => "",
        "last_name"       => "",
        "avatar"          => ""
        # TODO: can this filed be modified?
        # "resource_uri"    => ""
    }.freeze

    # Gets the basic information associated with an account and
    # a list of all of the repositories owned by the user.
    # See https://confluence.atlassian.com/display/BITBUCKET/user+Endpoint#userEndpoint-GETauserprofile
    #
    # = Examples
    #  bitbucket = BitBucket.new
    #  bitbucket.user_api.profile
    #
    def profile
      get_request("/user")
    end


    # Update a user

    # = Parameters
    # * <tt>:first_name</tt>    Optional string
    # * <tt>:last_name</tt>     Optional string
    # * <tt>:avatar</tt>        Optional string
    # * <tt>:resource_uri</tt>  Optional string
    #
    # = Examples
    #
    #  bitbucket = BitBucket.new
    #  bitbucket.user_api.update :first_name => 'first-name', :last_name => 'last-name'
    #

    def update( params={ })
      normalize! params
      filter! DEFAULT_USER_OPTIONS, params

      put_request("/user", DEFAULT_USER_OPTIONS.merge(params))

    end


    # GET a list of user privileges
    def privileges
      get_request("/user/privileges")
    end



    # GET a list of repositories an account follows
    # Gets the details of the repositories that the individual or team account follows.
    # This call returns the full data about the repositories including
    # if the repository is a fork of another repository.
    # An account always "follows" its own repositories.
    def follows
      get_request("/user/follows")
    end


    # GET a list of repositories visible to an account
    # Gets the details of the repositories that the user owns
    # or has at least read access to.
    # Use this if you're looking for a full list of all of the repositories associated with a user.
    def repositories
      get_request("/user/repositories")
    end

    alias :repos :repositories



    # GET a list of repositories the account is following
    # Gets a list of the repositories the account follows.
    # This is the same list that appears on the Following tab on your account dashboard.
    def overview
      get_request("/user/repositories/overview")
    end



    # GET the list of repositories on the dashboard
    # Gets the repositories list from the account's dashboard.
    def dashboard
      get_request("/user/repositories/dashboard")
    end

  end # User
end # BitBucket
