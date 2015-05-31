from social.backends.twitter import TwitterOAuth
from socialauth.models import Customer
from urllib.request import urlopen
from django.conf import settings
from boto.s3.connection import S3Connection
from boto.s3.key import Key


def updatefiletos3(imageurl, user):
    conn = S3Connection(settings.S3_ACCESS_KEY, settings.S3_SECRET_KEY)
    bucket = conn.get_bucket('fdtddjangoavatar')
    key = Key(bucket)
    image_name = 'tw_avatar_%s.jpg' % user.username
    key.key = image_name
    image_stream = urlopen(imageurl)
    key.set_contents_from_string(image_stream.read())
    key.set_acl('public-read')
    return key.generate_url(expires_in=0, query_auth=False)


def checkcustomerexsit(user):
    customerexsit = Customer.objects.filter(user=user).all()
    if len(customerexsit) == 0:
        return False
    else:
        return True


def createnewcustomer(user, datalink):
    customer = Customer()
    customer.user = user
    customer.avatar = datalink
    customer.save()


def create_customer_profile(backend, user, response, *args, **kwargs):
    print(backend)
    if isinstance(backend, TwitterOAuth):
        customerexsit = checkcustomerexsit(user)
        if not customerexsit:
            imageurl = response.get('profile_image_url')
            datalink = updatefiletos3(imageurl, user)
            createnewcustomer(user, datalink)

