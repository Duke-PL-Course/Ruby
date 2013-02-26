# Ruby Practice Review Problem

## LCD Numbers

Write a program that displays scalable, LCD-style numbers. This program should be written as a command line program, and should be called as follows:

```bash
ruby lcd.rb 012345
ruby lcd.rb 012345 2 # The second argument is optional; it's the scaling factor (the default should be 2)
```

The correct display for the previous input should be:

```
 --        --   --        -- 
|  |    |    |    | |  | |   
|  |    |    |    | |  | |   
           --   --   --   -- 
|  |    | |       |    |    |
|  |    | |       |    |    |
 --        --   --        -- 
```

If we scale the numbers by one, the command will be `ruby lcd.rb 0123 1`, and the output will be as follows:

```
 -       -   -       - 
| |   |   |   | | | |  
         -   -   -   - 
| |   | |     |   |   |
 -       -   -       - 
```

When scaled to 1, it should look like a seven-segment LCD digit. Scaling by *n* means that the hyphens should be duplicated *n* times, and the lines with `|` should be repeated *n* times.

## LCD Numbers Hint

* Consider using a template for each digit that holds the digit's LCD representation at a scale of 1. Combine this with [gsub][] or [sub][] as well as [index][] to manipulate the templates.
* Alternatively, take the more digital approach, rather than string manipulation, and represent the presence of each of the seven segments as on or off in a bit vector.

<!-- Links -->
[gsub]: http://www.ruby-doc.org/core-2.0/String.html#method-i-gsub
[sub]: http://www.ruby-doc.org/core-2.0/String.html#method-i-sub
[index]: http://www.ruby-doc.org/core-2.0/String.html#method-i-index
