#  GottaThing

GottaThing is an event countdown ios application. It is a toy project for me to learn Swift IOS development and is in very early stages of development.

Users of this application can add events, and specify a date and time in the future when it will occur. The app then holds all of these events and displays it in a colorful linear list. Personally this application helps me keep myself organised, and helps me keep track of any important and exciting things happening in the future. For example if you have a homework due date, interview, basketball practice, birthday party, pay day, all of these can be organised, categorised and kept track of in a fun way using this app.

Here is a short demo:

https://github.com/user-attachments/assets/5e931d64-e9c7-4c70-948e-a1db33b65e9f

The source code still mentions "daylist" which was a previous name for this.

The lists below shows the list of work that I have done, and still need to do.

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
- [ ] Randomise sample event/category colours - better samples (wording, colour, category etc)

More complex functionalities:

- [ ] Analytics - show statistics based on existing user data
- [ ] User should have some ability to change the visuals i.e. resize the Event cell in the List view
- [ ] Share countdowns with friends
- [ ] Create sub-countdowns
- [ ] Integrate google maps and allow users to search and select a location
- [ ] Export import csv
- [ ] Learn how to migrate schemas for SwiftData in case the Event schema needs to change
- [ ] Widgets - next up in a category

Bug list

- [ ] Seems like there is a delay when creating a new event when we want to start typing
- [x] Fix alignment of event items
- [x] There is a padding issue in the past events content view sometimes
- [ ] The default live countdown shows 0 before 1 second timer tick
- [ ] Currently you can add a new event with no name
- [ ] Update event and category colors not working
- [x] Events do not automatically move to the past events as time progresses

Dependencies

- https://github.com/xnth97/SymbolPicker?ref=iosexample.com

References

- https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app
