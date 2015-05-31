from social.backends.twitter import TwitterOAuth
from socialauth.models import Customer
from urllib.request import urlopen


def save_profile(backend, user, response, *args, **kwargs):
    if isinstance(backend, TwitterOAuth):
        customer = Customer.objects.filter(user=user).all()
        image_stream = urlopen(response.get('profile_image_url')).read()
        print(image_stream)
        if len(customer) == 0:
            display_name = response.get('screen_name')
            image_name = 'tw_avatar_%s.jpg' % display_name
            customer = Customer()
            customer.user = user
            customer.avatar = response.get('profile_image_url')
            customer.save()
