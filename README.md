# Graph Challenge

## Structure

* firstStep
    * main.rb
    * input
    * smallinput
    * tinyinput
    * mygraph.rb
* secondStep
    * main.rb
    * mygraph.rb
    * nodeContructor.rb

### FirstStep
In _firstStep_ Folder you can find the provided _input_ file as well as _smallinput_ and _tinyinput_,  the last two was used to check concepts in the development process

**Running**

On terminal simply run `ruby main.rb` than chose the input file:

    0 - input (the given input file)
    1 - smallinput
    2 - tinyinput

**Output**

The output gives an ordered by closeness array with node number and closeness associated to it

    3
    0.25
    2
    0.25
    5
    0.2
    1
    0.2
    4
    0.16666666666666666

### SecondStep

**Running**

On terminal simply run `ruby main.rb` than chose the input file:

    0 - input (the given input file)
    1 - smallinput
    2 - tinyinput

**Output**

The output gives an ordered by closeness array with node friend and closeness associated to it
```ruby
{"id"=>1, "fb_id"=>"131036157373897", "fb_name"=>"Dave Aladjbedjidgg Bharambeescu"}
0.25
{"id"=>4, "fb_id"=>"106867549796766", "fb_name"=>"Elizabeth Aladbjefcegic Liangson"}
0.16666666666666666
{"id"=>2, "fb_id"=>"129916347486339", "fb_name"=>"Ruth Aladjcibcijgf Sharpesen"}
0.16666666666666666
{"id"=>5, "fb_id"=>"103982660086723", "fb_name"=>"Sandra Aladbdifgcefc Alisonsky"}
0.14285714285714285
{"id"=>3, "fb_id"=>"128196280994089", "fb_name"=>"Barbara Aladaaaecgfdi Okelolason"}
0.14285714285714285
```
