#!/usr/bin/env python

try:
    import keyring
except ImportError:
    print('Failed to import keyring module, try one of the following: ')
    print('  pip install keyring')
    print('  easy_install keyring')
    print('  apt-get install python-keyring')
    exit(1)
import urllib2
import os
import argparse
import getpass
import pipes
import base64
import subprocess

# To get a list of supported backends : keyring.backend.get_all_keyring()
_SUPPORTED_BACKENDS = {'GnomeKeyring': keyring.backends.Gnome.Keyring(), 'OSXKeychain': keyring.backends.OS_X.Keyring()}
_API_URLS = { 'restricted': 'https://api.vcd.portal.skyscapecloud.gsi.gov.uk', 'unrestricted': 'https://api.vcd.portal.skyscapecloud.com' }
envfile = "%s/.vcloud_env" % os.environ['HOME']
VCLOUD_ENV = []

parser = argparse.ArgumentParser()
parser.add_argument('-o', '--org', dest='org',help='vCloud Organisation, this is simply an identifier', required=True)
parser.add_argument('-k', '--keyring', dest='keyring', help='Keyring backend to use, only %s are supported' % _SUPPORTED_BACKENDS.keys())
parser.add_argument('-u', '--url', dest='url', help='vCloud URL, you can use "restricted" for GSI/PSN and "unrestricted" as shortcuts to the respective URL or you can specifiy exact URL')

args = parser.parse_args()
org = args.org

def _write_out_envfile(env_list):
    # AFAIK, there is no standard module that allows me to parse shell style config files
    # and update them. I could hack around with ConfigParser, but that would add complexity
    # that isn't really required.
    # So, as the file is unlikely to get big, easier to just read the file in to a dict
    # then update dict, truncate file and write the dict back out to file.
    config = {}
    if os.path.isfile(envfile):
        f = open(envfile, 'r')
        # Read the file in to a dict for easier matching
        for l in f.readlines():
            try:
                key, value = l.split('=', 1)
                config[key] = value
            except:
                pass
        f.close()

    f = open(envfile, 'w+')
    # Set config dict with values we want
    for e in env_list:
        if e in os.environ:
            config['export %s' % e] = os.environ[e]
    # Write out to file with new values
    for key, value in config.items():
        f.write("%s=%s\n" % (key, value ))
    f.close()

def _guess_keyring():
    if 'GNOME_KEYRING_PID' in os.environ:
        return _SUPPORTED_BACKENDS.get('GnomeKeyring')
    if os.path.isfile('/Library/Preferences/com.apple.security.plist'):
        return _SUPPORTED_BACKENDS.get('OSXKeychain')
    return None

def _get_token(username, password):
    vcloud_url = "%s/api/sessions" % api
    request = urllib2.Request(vcloud_url)
    base64string = base64.b64encode(str(username+":"+password).encode('ascii'))
    request.add_header("Authorization", "Basic %s" % base64string.decode("utf-8"))
    request.add_header("Accept", "application/*+xml;version=1.5")
    request.get_method = lambda: 'POST'
    try:
        result = urllib2.urlopen(request)
    except urllib2.HTTPError as e:
        print('The server couldn\'t fulfill the request.')
        print('Error code: ', e.code)
        exit()
    except urllib2.URLError as e:
        print('We failed to reach a server.')
        print('Reason: ', e.reason)
        exit()
    except ValueError as e:
        print('Problem with URL: ', e)
        exit()
    else:
        return result.info().getheader('x-vcloud-authorization')

def _get_set_creds(org):
    if "VCLOUD_%s_USER" % org not in os.environ:
        username = raw_input("# Please enter your username for %s: " % org)
        os.environ["VCLOUD_%s_USER" % org] = username
    else:
        username = os.environ["VCLOUD_%s_USER" % org]
    print("export VCLOUD_%s_USER=%s" % ( org, pipes.quote(str(username)) ))
    VCLOUD_ENV.append("VCLOUD_%s_USER" % org)
    password = keyring.get_password("vcloud_%s" % org, username)
    if password is None:
        password = getpass.getpass("# Please enter your password for %s: " % org)
        keyring.set_password("vcloud_%s" % org, username, password)
    token = _get_token(username, password)
    os.environ["VCLOUD_%s_TOKEN" % org] = token
    print( "export VCLOUD_%s_TOKEN=%s" % ( org, pipes.quote(str(token)) ))
    VCLOUD_ENV.append("VCLOUD_%s_TOKEN" % org)


if args.keyring is None:
    kb = _guess_keyring()
    if kb is not None:
        keyring.set_keyring(kb)
    else:
        print("Could not guess which keyring backend to use, please sepcifiy with -k")
        exit(1)
else:
    kb = _SUPPORTED_BACKENDS.get(args.keyring)
    keyring.set_keyring(kb)

if args.url is not None:
    args.url = args.url.lower()
    if args.url in _API_URLS:
        api = _API_URLS.get(args.url)
    else:
        api = args.url
else:
    if "VCLOUD_%s_API" % org not in os.environ:
        api = raw_input("# Please enter the API URL for %s: " % org)
    else:
        api = os.environ["VCLOUD_%s_API" % org]


_get_set_creds(org)

os.environ["VCLOUD_%s_API" % org] = api
VCLOUD_ENV.append("VCLOUD_%s_API" % org)
print( "export VCLOUD_%s_API=%s" % ( org, pipes.quote(str(api)) ))

ORG_TOKEN = os.environ["VCLOUD_%s_TOKEN" % org]
print("export FOG_VCLOUD_TOKEN=%s" % ( pipes.quote(str(ORG_TOKEN)) ))
os.environ['FOG_VCLOUD_TOKEN'] = ORG_TOKEN
VCLOUD_ENV.append("FOG_VCLOUD_TOKEN")

_write_out_envfile(VCLOUD_ENV)
print("\n# Now run 'source %s'" % envfile)
