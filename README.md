### Project Setup
- Minumium Deployment: iOS 17.0
- Swift verison: 6.0

### Project Requirements Checklist
- ✅ Swift Concurrency: Use of async / await for network requests, image loading, data loading
- ✅ No External Dependencies: Only Apple frameworks 
- ✅ Efficient Network Usage: Caching of images. Only hit network when needed
- ✅ Testing: Unit testing for valid api and json decoding
- ✅ SwiftUI: SwiftUI flow and api's. 

### Resources
1) https://matteomanferdini.com/swiftui-asyncimage/

### Summary: Include screen shots or a video of your app highlighting its features

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I chose to prioritize the UI and the logic of utlizing both the search bar and filter of recipes. I wanted to provide a seamless experience, allowing the user to fine tune their search. 

Secondly, I decided to implement a random recipe feature to help the user decided more quickly if they don't have a preference. One issue I came across but don't have time to troubleshoot, is when the user is on the random recipe view and the app goes into background mode, once the app comes to foreground the randome recipe is not the same. My solution would be to store the random recipe and only trigger to update it via button. 

Thirdly, I chose to prioritize learning to cache images using AsyncImage. I found an interesting article (Resource 1) that goes into depth on how AsyncImage doesn't truly cache images, even though Apple documention sort of suggests it's suppose to. 

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I worked on this project for about 14 hours. 8 hours focused, 6 hours with some distractions (work, personal life, etc.)

I prioritized my downtime to work on this app, usually during work breaks, lunch, after hours.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I wanted to use modern SwiftUI and with the latest Swift 6 version that helps with concurrency. Unfortunatley the tradeoff with this approach is that later iOS versions ( < 17.0 ) aren't compatible. 

### Weakest Part of the Project: What do you think is the weakest part of your project?
I think my weakest part is Unit Testing. I don't have a ton of experience in that setting, although I am looking to dive deeper into it and gain more skills. I tried to implement a couple test cases: 1) Valid api / http response status code, and 2) Valid json data decoding.

Another weakenss is the lack of mock data for previews. 

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
You will notice my repo and project is written by BrilyanteApps, which is my business. I am sole proprietor, all the work in this project was done by me, Matthew Mejia. 

