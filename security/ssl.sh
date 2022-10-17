#-----------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------
# Create
# 
# try to use 256 bit
#
# Use SSl from a trusted certificate authority (CA).
#
# CA is a company that issues andmanages security credentials.
#
# Run the following command to create your 2048 bit keystore:

$ echo y | keytool -genkeypair -dname "cn=Mark Jones, ou=JavaSoft, o=Sun, c=US" 
   -alias business
   -keysize 2048
   -keypass 123changeit
   -keystore ~/application.keystore 
   -storepass 123456changeit
   -validity 20000
   -storetype PKCS12
   -keyalg RSA
 
# 
# (dont forget to format it for 1 line)
#
# dname is a unique identifier for the application in the .keystore
# -> cn : the full name of the person or organization that generates the .keystore
# -> ou : Organizational Unit that creates the project, its a subdivision of the Organization that creates it. Ex. android.google.com
# ->  o : Organization owner of the whole project. Its a higher scope than ou. Ex.: google.com
# ->  c : The country short code. Ex: For United States is "US"
#
# alias Identifier of the app as an single entity inside the .keystore (it can have many)
#
# keypass Password for protecting that specific alias.
#
# keystore Path where the .keystore file shall be created (the standard extension is actually .ks)
#
# storepass Password for protecting the whole .keystore content.
#
# validity Amout of days the app will be valid with this .keystore
#
# keysize is the size in bit 
#
# storetype This qualifier specifies the type of keystore to be instantiated.
#
# Note the alias you use here to create the keystore. 
# You will need to use the same alias later when you install your certificate.
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------
#
# Generate a CSR (Certificate Signing Request) From the Keystore
# To create your CSR, run the following command:

$ keytool -certreq -keyalg RSA -alias business -file ~/certreq.csr -keystore ~/application.keystore -storepass 123456changeit


# To find your CSR, enter the command:

$ type ~/certreq.csr


# To list 

$ keytool -list -v -keystore ~/application.keystore 

# Now the certreq.csr file can import the certificate into your client, most likely a browser, and start accessing your APIs


#-----------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------
#
# Import the Primary/Server Certificate, Root, and Intermediate CA Certificates to Keystore
# Once the CA signed the certificate and share it with us, we need to import the certificate to the keystore for the private key entry we created.

$ keytool -import -alias ssl -keystore ~/application.keystore -file ~/certreq.csr  

$ keytool -import -trustcacerts -alias ssl -file ~/certreq.csr -keystore ~/application.keystore


#-----------------------------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------
#
# To import an existing certificate signed by your own CA into a PKCS12 keystore using OpenSSL you would execute a command like:

$ openssl pkcs12 -export -in mycert.crt -inkey mykey.key
                        -out mycert.p12 -name tomcat -CAfile myCA.crt
                        -caname root -chain
                        
                        
                        
                        
$ keytool -genkeypair 
    -alias tomcat 
    -keyalg RSA 
    -keysize 2048 
    -storetype PKCS12 
    -keystore keystore.p12 
    -validity 3650                        


