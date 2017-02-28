# URLockBox

## MidModule Assessment

The URLockbox is a starter app for the mid-module assessment for backend engineering module4 at TuringSchool of Software and Design.

Be sure to get familiar with what is already done, and what is not. No features are complete, but there is some set up done for several features. Use commit history if that helps.

### Testing with PhantomJS using poltergeist

The app has phantom.js, a headless webdriver installed for JS testing.

#### Setup

To set it up you will just need to run `npm install phantomjs -g`. Everything else will be installed with Bundle.

#### Use

You can then write capybara feature tests and add `js: true` tag to each test the has JavaScript.  Your tests will execute and recognize your JavaScript.

If you're having problems troubleshooting asynchronous actions (like DOM changes after an AJAX request), [peruse this section of Capybara's docs](https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends)

#### Your JavaScript

The major __GOTCHA__ here is that phantomjs doesn't recognize es6. So if you write es6 you will need to make your file extenstion `.js.es6`. You should see an example test in the `spec/features` directory.

### Two Apps in One

URLockbox is dependent on [Hot-Reads](https://github.com/JStans12/mod4final-hotreads). Every time you hit the index page of URLockbox, it sends an ajax request to Hot-Reads to get the 10 hottest reads for the last 24 hours.
<br>
Luckily, Hot-Reads is already setup and can be accessed at https://salty-journey-86577.herokuapp.com/ . Now those are some HOT READS!
