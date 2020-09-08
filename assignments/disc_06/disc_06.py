
##############
#    Q1.2    #
##############

def nonlocalist():
    """
    >>> prepend, get = nonlocalist()
    >>> prepend(2)
    >>> prepend(3)
    >>> prepend(4)
    >>> get(0)
    4
    >>> get(1)
    3
    >>> get(2)
    2
    >>> prepend(8)
    >>> get(2)
    3
    """
    # # Almost got it right! I returned get instead of lambda x: get(x).
    get = lambda x: "Index out of range!"
    def prepend(value):
        nonlocal get
        f = get
        def get(i):
            if i == 0:
                return value
            return f(i-1)
    return prepend, lambda x: get(x)


##############
#    Q2.1    #
##############

class Student:
    students = 0 # this is a class attribute
    def __init__(self, name, ta):
        self.name = name # this is an instance attribute
        self.understanding = 0
        Student.students += 1
        print("There are now", Student.students, "students")
        ta.add_student(self)

    def visit_office_hours(self, staff):
        staff.assist(self)
        print("Thanks, " + staff.name)

class Professor:
    def __init__(self, name):
        self.name = name
        self.students = {}

    def add_student(self, student):
        self.students[student.name] = student

    def assist(self, student):
        student.understanding += 1

def Q21():
    """
    >>> snape = Professor("Snape")
    >>> harry = Student("Harry", snape)
    There are now 1 students
    >>> harry.visit_office_hours(snape)
    Thanks, Snape
    >>> harry.visit_office_hours(Professor("Hagrid"))
    Thanks, Hagrid
    >>> harry.understanding
    2
    >>> [name for name in snape.students]
    ['Harry']
    >>> x = Student("Hermione", Professor("McGonagall")).name
    There are now 2 students
    >>> x
    'Hermione'
    >>> [name for name in snape.students]
    ['Harry']
    """


##############
#    Q2.2    #
##############

class Email:
    """Every email object has 3 instance attributes: the
    message, the sender name, and the recipient name."""
    def __init__(self, msg, sender_name, recipient_name):
        self.msg = msg
        self.sender_name = sender_name
        self.recipient_name = recipient_name

class Server:
    """Each Server has an instance attribute clients, which
    is a dictionary that associates client names with
    client objects."""
    def __init__(self):
        self.clients = {}
    def send(self, email):
        """Take an email and put it in the inbox of the client
        it is addressed to."""
        sender_client = self.clients[email.recipient_name]
        sender_client.receive(email)
    def register_client(self, client, client_name):
        """Takes a client object and client_name and adds it
        to the clients instance attribute."""
        self.clients[client_name] = client


class Client:
    """Every Client has instance attributes name (which is
    used for addressing emails to the client), server
    (which is used to send emails out to other clients), and
    inbox (a list of all emails the client has received)."""
    def __init__(self, server, name):
        self.inbox = []
        self.server = server
        self.name = name
        self.server.register_client(self, self.name)

    def compose(self, msg, recipient_name):
        """Send an email with the given message msg to the
        given recipient client."""
        email = Email(msg, self.name, recipient_name)
        self.server.send(email)

    def receive(self, email):
        """Take an email and add it to the inbox of this
        client."""
        self.inbox.append(email)


##############
#    Q3.1    #
##############

class Pet():
    def __init__(self, name, owner):
        self.is_alive = True    # It's alive!!!
        self.name = name
        self.owner = owner
    def eat(self, thing):
        print(self.name + " ate a " + str(thing) + "!")
    def talk(self):
        print(self.name)

class Dog(Pet):
    def talk(self):
        print(self.name +'says woof!')


class Cat(Pet):
    def __init__(self, name, owner, lives=9):
        self.lives = lives
        Pet.__init__(self, name, owner)

    def talk(self):
        """ Print out a cat's greeting.
        >>> Cat('Thomas','Tammy').talk()
        Thomas says meow!
        """
        print(self.name +' says meow!')
        
    def lose_life(self):
        """Decrements a cat's life by 1. When lives reaches zero,'is_alive'
        becomes False.
        """
        if self.lives:
            self.lives -= 1
            if not self.lives:
                self.is_alive = False
        else:
            print("This cat has no more lives to lose :(")


##############
#    Q3.2    #
##############

class NoisyCat(Cat):
    """A Cat that repeats things twice."""
    def talk(self):
        """Talks twice as much as a regular cat.
        >>> NoisyCat('Magic','James').talk()
        Magic says meow!
        Magic says meow!
        """
        Cat.talk(self)
        Cat.talk(self)



##############
#    Q3.2    #
##############

class Foo:
    def __init__(self, bar):
        self.bar = bar
    def g(self, summand):
        return self.bar + summand

def q32():
    """docstring for Foo.
    >>> x = Foo(1)
    >>> x.g(3)
    4
    >>> x.g(5)
    6
    >>> x.bar = 5
    >>> x.g(5)
    10
    """
