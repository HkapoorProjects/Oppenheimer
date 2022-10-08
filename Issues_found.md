# Issues Observed in this Code
## Some Points which was not clear:

-   There is no documentation regarding the type of records
-   While running the post api for multiple record entry, dev mistakenly use https instead of http for local testing
-   Post request should thow an error when length of 'NATID' is less than 4 char, rather breaking the index call
-   The response of TaxRelief api's give different values in second value of decimal than the computation formula provided

