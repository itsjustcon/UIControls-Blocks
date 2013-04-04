# UIControls + Blocks

**UIControls+Blocks**, is the dead-simple, missing link between iOS interface controls and objective-c blocks.

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
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSLog(@"Creating cell for section: %i and row: %i", section, row);
    cell.textLabel.text = @"";
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.imageView.image = nil;
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

## Author

**[Connor Grady](http://connorgrady.com/)**

