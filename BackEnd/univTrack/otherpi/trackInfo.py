import shippo
from . import serviceTrack

#  test key
shippo.config.api_key = 'shippo_test_a23d47137308fe441ddcde413467c8f2e8ed742a'
shippo.config.api_version = "2018-02-08"
shippo.config.verify_ssl_certs = True
shippo.config.rates_req_timeout = 30.0
shippo.config.timeout_in_seconds = None 

def getInfoTrack(tracking_number):
    carrier_token = serviceTrack.get_service(tracking_number)
    if(carrier_token == None): 
        print('Tracking ID error, returning shippo')
        return shippo.Track.get_status('shippo', 'SHIPPO_TRANSIT')
    
    try:
        data = shippo.Track.get_status(carrier_token, tracking_number)
        return data
    except:
        print('Tracking ID does not exist in the data base')
        return shippo.Track.get_status('shippo', 'SHIPPO_TRANSIT')


#tracking_number = "SHIPPO_TRANSIT" #'9102969010383081813033'


