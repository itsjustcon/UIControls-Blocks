# UIControls + Blocks

**UIControls+Blocks**, is the dead-simple, missing link between iOS interface controls and objective-c blocks. No more delegates and useless methods, just blocks!

## How To Use?
There's two ways you can use all this great stuff:  
1. Import all the files in your project and add the main header: `#import "UIControls+Blocks.h"`  
2. *Or* just include the controls you want like: `#import "UIButton+Blocks.h"`  

## Examples

### UIButton+Blocks

##### Handle Control Events
```objective-c
[myButton handleControlEvent:UIControlEventTouchDown withBlock:^{
	NSLog(@"You pressed my button!");
}];
```

***

### UITableView+Blocks

##### Set Number of Rows
No more `numberOfRowsInSection` nonsense:
```objective-c
[myTable setNumberOfRows:1];
```

Want multiple sections? No problem! Just pass an array of row values. Here's 3 sections with 2 rows each:
```objective-c
[myTable setNumberOfRowsInSections:@[@2,@2,@2,]];
```

##### Cell Drawing
The `cellForRowAtIndexPath` alternative is `handleCellCreationWithBlock` like so:

```objective-c
[myTable handleCellCreationWithBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath){
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    NSLog(@"Creating cell for section: %i and row: %i", [indexPath section], [indexPath row]);
    cell.textLabel.text = @"";
    return cell;
}];
```

##### Cell Selection
The `didSelectRowAtIndexPath` alternative is `handleCellSelectionWithBlock` like so:

```objective-c
[myTable handleCellSelectionWithBlock:^void(UITableView *tableView, NSIndexPath *indexPath){
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = [indexPath row];
    NSLog(@"Selected cell: %i",row);
}];
```

***

### UIPickerView+Blocks

##### Set Row Titles
The `numberOfRowsInComponent` and `titleForRow` alternative is `setTitles`. You must pass in a two dimensional array, like so:

```objective-c
[myPicker setTitles:@[ @[@"Component1Row1",@"Component1Row2"], @[@"Component2Row1",@"Component2Row2"] ]];
```

##### Row Selection
The `didSelectRow` alternative is `handleSelectionWithBlock` like so:

```objective-c
[myPicker handleSelectionWithBlock:^void(UIPickerView *pickerView, NSInteger row, NSInteger component){
	NSLog(@"You pressed row: %i in component: %i!", row, component);
}];
```

## Author

**[Connor Grady](http://connorgrady.com/)**

