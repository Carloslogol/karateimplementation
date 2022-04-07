#Author: Carlos José Cogollo Hernandez

  Feature: Update register from page

    Background:
      * def urlBase = 'https://reqres.in'
      * def updatePath = '/api/users/2'

    Scenario Outline:
      As a Admin
      I want to get the corresponding response_code <status_code>

      Given url urlBase + updatePath
      And request { 'name' : <user_name>, 'job' : <job> }
      When method PUT
      * print response
      Then response.status == <status_code>
      Examples:
        | user_name |     job     | status_code |
        |  carlos   |   Enginner  |     200     |
        |  Andres   |   Pilot     |     200     |