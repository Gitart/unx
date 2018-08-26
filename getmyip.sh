 ## Get my IP in global network
 
 lwp-request -o text checkip.dyndns.org | awk '{ print $NF }'
