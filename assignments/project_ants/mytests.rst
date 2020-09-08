This file holds the tests that you create. Remember to import the python file(s)
you wish to test, along with any other modules you may need.
Run your tests with "python3 ok -t --suite SUITE_NAME --case CASE_NAME -v"
--------------------------------------------------------------------------------

Suite 0

	>>> from ants import *

	Case Example
		>>> x = 5
		>>> x
		5


Suite 1

	>>> from ants import *
	>>> beehive = Hive(make_test_assault_plan())
	>>> colony = AntColony(None, beehive, ant_types(), dry_layout, (1, 5))

	Case 1

		>>> harvester = HarvesterAnt()
		>>> harvester.action(colony)
		>>> colony.food
		3
		>>> harvester.action(colony)
		>>> colony.food
		4


Suite 2

	>>> from ants import *
	>>> beehive = Hive(make_test_assault_plan())
	>>> colony = AntColony(None, beehive, ant_types(), dry_layout, (1, 5))
	>>> first_place = Place('first_place')
	>>> print(first_place.entrance)
	None
	>>> second_place = Place('second_place', first_place)
	>>> first_place.entrance is second_place
	True
