# inspec-f5

A resource pack for F5 BigIP load balancers with a few resources to demonstrate how to
access appliances with REST API's

## Resources provided

### f5_certificates (Plural resource)

| Plural          | Single         | Description                                                                       |
|-----------------|----------------|-----------------------------------------------------------------------------------|
| cities          | city           | Location - city                                                                   |
| common_names    | common_name    | The common name of the certificate                                                |
| countries       | country        | Location - country                                                                |
| emails          | email          | The email contact for the certificate                                             |
| expirations     | expiration     | The expiration date of the certificate                                            |
| fingerprints    | fingerprint    | The fingerprint of the certificate                                                |
| issuers         | issuer         | The CA that signed the certificate                                                |
| keysizes        | keysize        | The size of the certificates private key                                          |
| keytypes        | keytype        | The type of the certificates private key                                          |
| names           | name           | The F5 name of the certificate                                                    |
| organizations   | organization   | The organisation name of the certificate                                          |
| ous             | ou             | The organisational unit (department) of the certificate                           |
| states          | state          | Location - state                                                                  |
| valid_days      | valid_days     | The number of valid days remaining before the certificate expires                 |

### f5_software (Singular resource)

| Property      | Description                                                                       |
|---------------|-----------------------------------------------------------------------------------|
| version       | The F5 BigIP software version                                                     |

## Contributing

Standard stuff... contributions welcome... open issues and pull requests using the normal github process.
