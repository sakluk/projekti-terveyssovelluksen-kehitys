*** Settings ***                                                                                       
Library    Collections                                                                                 
Library    RequestsLibrary                                                                             
                                                                                                       
Suite Setup    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com                   
                                                                                                       
*** Test Cases ***                                                                                     
                                                                                                       
Get Request Test                                                                                       
    ${resp}=     GET On Session    jsonplaceholder    /posts/1

    Log    ${resp.json()}     # Log the response json

    Status Should Be    200    ${resp}
    Dictionary Should Contain Key    ${resp.json()}  title
    Dictionary Should Contain Value    ${resp.json()}    sunt aut facere repellat provident occaecati excepturi optio reprehenderit
    Should Be Equal As Strings    ${resp.json()}[title]    sunt aut facere repellat provident occaecati excepturi optio reprehenderit                                                                                              
    Should Contain    ${resp.json()}[title]    sunt aut facere 
                                                                                                       
Post Request Test                                                                                      
    &{data}=    Create dictionary    title=Robotframework requests    body=This is a test!    userId=1       
    ${resp}=    POST On Session      jsonplaceholder    /posts    json=${data}    expected_status=anything     
    
    Log    ${resp.json()}     # Log the response json
                                                                                                       
    Status Should Be    201    ${resp}