# To active debug mode, find the deployement and update before jar:

'-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005'

Ex:

 - '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005'
 - 'jar'

 # Open container ports:

 - name: debug
   containerPort: 5005
   protocol: TCP
