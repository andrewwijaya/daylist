#  Daylist

Daylist is an event countdown ios application.

Core functionality:

- [x] Ability to add/delete/update new events
- [x] Event objects hold a title and date
- [x] Events are shown in two lists, current, and past events
- [x] Events are persisted using SwiftData

Functionality to do list:

- [x] Events need to have a time associated to it, not just a date
- [x] Ability to add icons
- [ ] Ability to change icons
- [ ] Add support of emoji icons
- [x] Ability to add event background color
- [ ] Ability to change event background color
- [x] Convert wording of past events to i.e. "2 days ago"
- [ ] Push notification support, and ability to customise when the alert appears
- [x] Countdown time should tick down in real time
- [ ] Support repeated events
- [ ] Support for Event Series - which is a way to categorise events
- [ ] Event titles that are longer than the width of the Event Cell should have a ticker style animation
- [x] Ability to copy events
- [ ] Subcountdowns
- [ ] Share countdowns
- [ ] Task series - sub goals etc
- [ ] Done/Not done markers (check marks / green vs red)
- [ ] Create custom image picker - remove dependencies
- [ ] Add a settings tab
    - [ ] Dark mode toggle
    - [ ] Change the colors / theme of the app
- [ ] Configure notifications on events (push/alarm/alert)
- [x] Ability to add notes to events
- [ ] Add checkmark on events

More complex functionalities:

- [ ] Analytics - show statistics based on existing user data
- [ ] User should have some ability to change the visuals i.e. resize the Event cell in the List view
- [ ] Share countdowns with friends
- [ ] Create sub-countdowns
- [ ] Integrate google maps and allow users to search and select a location
- [ ] Export import csv
- [ ] Learn how to migrate schemas for SwiftData in case the Event schema needs to change

Bug list

- [ ] Seems like there is a delay when creating a new event when we want to start typing
- [x] Fix alignment of event items
- [x] There is a padding issue in the past events content view sometimes
- [ ] The default live countdown shows 0 before 1 second timer tick

Dependencies

- https://github.com/xnth97/SymbolPicker?ref=iosexample.com

References

- https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app
