from social.backends.twitter import TwitterOAuth


def save_profile(backend, user, response, *args, **kwargs):
    if isinstance(backend, TwitterOAuth):
        print(response)
