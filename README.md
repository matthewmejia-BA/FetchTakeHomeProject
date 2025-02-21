### Project Setup
- Minumium Deployment: iOS 17.0
- Swift verison: 6.0

### Project Requirements Checklist
- ✅ Swift Concurrency: Use of async / await for network requests, image loading, data loading
- ✅ No External Dependencies: Only Apple frameworks 
- ✅ Efficient Network Usage: Caching of images. Only hit network when needed
- ✅ Testing: Unit testing for valid api and json decoding
- ✅ SwiftUI: SwiftUI flow and api's.
- ✅ Handle errors if malformed json or empty data - update views appropriately.

### Resources
1) https://matteomanferdini.com/swiftui-asyncimage/

### Summary: Include screen shots or a video of your app highlighting its features

## Main screen

<img width="471" alt="Screenshot 2025-02-20 at 4 44 24 PM" src="https://github.com/user-attachments/assets/27fcf5b5-7d62-42ab-b7d3-d5496cefac43" />

## Cuisine Types

<img width="471" alt="Screenshot 2025-02-20 at 4 46 04 PM" src="https://github.com/user-attachments/assets/9dc6efc5-79a5-440b-9720-aab12707d584" />

## Search Query + Cuisine Type

<img width="471" alt="Screenshot 2025-02-20 at 4 46 19 PM" src="https://github.com/user-attachments/assets/b83331a8-ac9d-4632-b328-136c2d216c74" />

## Random Recipe Feature

<img width="471" alt="Screenshot 2025-02-20 at 4 45 17 PM" src="https://github.com/user-attachments/assets/fce162a3-8a5f-45ab-bb76-2ce6d3cf727b" />

## Empty JSON data
<img width="471" alt="Screenshot 2025-02-20 at 4 53 24 PM" src="https://github.com/user-attachments/assets/99aed574-1596-451a-847d-5169cc16dd0d" />

## Malformed JSON data
<img width="471" alt="Screenshot 2025-02-20 at 4 54 04 PM" src="https://github.com/user-attachments/assets/9bf4bd60-70d5-4914-bc2d-d42288115b9c" />


### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I chose to prioritize the UI and the logic of utilizing both the search bar and filter of recipes. I wanted to provide a seamless experience, allowing the user to fine tune their search. 

Secondly, I decided to implement a random recipe feature to help the user decided more quickly if they don't have a preference. One issue I came across but don't have time to troubleshoot, is when the user is on the random recipe view, app goes into background mode, and once the app comes to foreground the randome recipe is not the same. My solution would be to store the random recipe and only trigger to update it via button. 

Thirdly, I chose to prioritize learning to cache images using AsyncImage. I found an interesting article (Resource 1) that goes into depth on how AsyncImage doesn't truly cache images, even though Apple documention sort of suggests it's suppose to. 

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I worked on this project for about 14 hours. 8 hours focused, 6 hours with some distractions (work, personal life, etc.)

I prioritized my downtime to work on this app, usually during work breaks, lunch, after hours.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I wanted to use modern SwiftUI and with the latest Swift 6 version that helps with concurrency. Unfortunatley the tradeoff with this approach is that earlier iOS versions ( < 17.0 ) aren't compatible. 

### Weakest Part of the Project: What do you think is the weakest part of your project?
I think my weakest part is Unit Testing. I don't have a ton of experience in that setting, although I am looking to dive deeper into it. I tried to implement a couple test cases: 1) Valid api / http response status code, and 2) Valid json data decoding. I would probably add abother test case about caching of images.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
You will notice my repo and project is written by BrilyanteApps, which is my business. I am a sole proprietor, all the work in this project was done by me, Matthew Mejia. 

