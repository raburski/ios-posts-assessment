# ios-posts-assessment
This project is a demo implementation requested by one of my interviewers.    
App architecture is based on DDD and one-way data flow (redux like).    
Code follows SOLID principles and should be easily testable.   
THIS IS NOT THE DEMO OF SLEEK UI RENDERING

## Requirements

Use following URLs with JSON responses as your data sources.  
 
 -   GET http://jsonplaceholder.typicode.com/posts
 -   GET http://jsonplaceholder.typicode.com/users
 -   GET http://jsonplaceholder.typicode.com/comments
    
Create simple app with following screens:

 -   Screen 1: List of post titles; selecting a title takes you to the post details
 -   Screen 2: Post details: title, body, authors username, comments count
 
Bonus (due to time limitations, not implemented):
 -   Based on the user’s email address, use http://avatars.adorable.io to generate a unique avatar for each of the user. To be shown on both screens.
 -   Tapping on user name should take you to a third screen with all user information including a map of their location based on lat and long values.

 
## TODO

1. Create separate target for View/Controllers.
2. Use nib and custom init in order to inject sources/interactors to ViewControllers.
3. Pull-to-refresh.
4. Fix broken views constraints.
5. Create factory for ViewControllers.
6. Create flow-handling interactors in the Application target.
7. Change persistency to something more suitable than NSUserDefaults.
8. ‼️ TESTS
 
