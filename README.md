# catchup

A very poorly designed SwiftUI application by some non-CS undergrad students at UCSD.

Katherine Wong & John Adams

# Documentation for Understanding Application Files and Functions


## View Interactions

NavigationView Structure:
>GroupsView {GroupsRowView <- ListViewModel}
>>ListView {ListRowView <- ListViewModel}
>>>AddView

## Basic Functionality

1. Setup
   - Initialize `ListViewModel` (read/import stored data)
     - `ListViewModel` stores each `PersonModel` in a globally accessible variable, as well as many functions for updating the list.
   - Create `NavigationView` and open `GroupsView`
2. GroupsView
   - `ScrollView` with a `NavigationLink` to `ListView` for each group of people (currently only includes family list)
   - Call `GroupsRowView(personModel)` to display the first 4 members of the `ListViewModel`
3. ListView 
   - Call `ListRowView` to build a list of all people in the selected group
     - List object encapsulates people, with `.onDelete` & `.onMove` for editing the list of people
   - `.navigationBarItems` includes `NavigationLink` to `AddView`
4. AddView
   - two strings for `personModel.name` and contact `personModel.frequency` initilized empty
   - create text fields for the two strings
   - ask permission for notification usage
   - add people with `listViewModel.addPerson(newPerson: person)`
