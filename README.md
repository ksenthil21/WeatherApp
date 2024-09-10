Using SwiftUI in XCode, I've created an iOS application that can show the temperature, wind speed, humidity, 
and other relevant information through OpenWeather API calls. To put my own personal twist to the classic
weather app, I implemented a feature to show a random picture from the current location of the user. For
example, if the user is opening the app in San Francisco, not only will the current weather for San Franciso be showed but also a randomly taken image from near the exact longitude and latitude of the user. That
means that by checking the weather in different parts of San Francisco, different pictures will be shown.
I implemented this through Flicker API calls which use the geo location of the user.
