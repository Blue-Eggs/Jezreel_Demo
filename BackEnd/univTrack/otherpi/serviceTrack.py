# reference by https://andrewkurochkin.com/blog/code-for-recognizing-delivery-company-by-track


import re

def get_service(tracking):
    service = None
   
    usps_pattern = [
        '^(91|93|92|94|95)[0-9]{20}$',
        '^(91|93|92|94|95)[0-9]{22}$',
        '^(70|14|23|03)[0-9]{14}$',
        '^(M0|82)[0-9]{8}$',
        '^([A-Z]{2})[0-9]{9}([A-Z]{2})$'
    ]

    ups_pattern = [
        '^(1Z)[0-9A-Z]{16}$',
        '^(T)+[0-9A-Z]{10}$',
        '^[0-9]{9}$',
        '^[0-9]{26}$'
    ]
    
    fedex_pattern = [
        #'^[0-9]{20}$',
        #'^[0-9]{15}$',
        '^[0-9]{12}$',
        #'^[0-9]{22}$'
    ]
    
    usps = "(" + ")|(".join(usps_pattern) + ")"
    fedex = "(" + ")|(".join(fedex_pattern) + ")"
    ups= "(" + ")|(".join(ups_pattern) + ")"
    
    if re.match(usps, tracking) != None:
        service = 'usps'
    elif re.match(ups, tracking) != None:
        service = 'ups'
    elif re.match(fedex, tracking) != None:
        service = 'fedex'

    return service