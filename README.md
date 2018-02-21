![Screenshot](QA_Tester_-_Task_pdf_1_page_.png)

## Overview
Write a series of test cases to perform for a user inputting data on the page shown in the screenshot. I've completed the exercise using Ruby and RSpec to simulate user input with some methods printing to STDOUT to simulate an alert banner.

## Acceptance Criteria
- The input must be between 4 and 6 digits
- The input must be larger than the previous previous number (unless the meter has rolled over)
- The input must be approximately within the estimated usage for the household in the time period since the previous meter read

## Testing

Install ```rspec```

```gem install rspec```

Then run tests:
```$ rspec```

Test coverage: 98.5%

## Assumptions
- Tests are based on a four digit meter that rolls over at 9999
- The range estimate for acceptable readings is +/- 15% based on a monthly increase of 5%
- The meter starts with an initial value, in this case 8000
- I've added a test case for the user entering less than four digits

## Questions
There are a few questions regarding the page that I'd want to clarify for production code:
- What is the average monthly percentage increase in electricity?
- How does this change depending on the time of year, e.g. winter vs summer?
- What happens if the user enters less than four digits?
