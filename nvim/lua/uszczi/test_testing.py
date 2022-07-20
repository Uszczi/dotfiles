import pytest


@pytest.fixture(scope="function")
def foo(request):
    return request.param


@pytest.mark.parametrize("foo", [((2, 1, 3), (1, 3))], indirect=True)
def test_foo(foo):
    print(foo)
    assert False


def foo2():
    def bar():
        return 1

    result = bar()
    return result


class Car:
    def __init__(self, color, model):
        self.color = color
        self.model = model

    def __str__(self):
        return f"{self.color} {self.model}"

    def f(self):
        def a():
            return 1

        return a()


def pretty_long(
    some_long_variable: str,
    another_long_variable: str,
    yet_another_long_variable: int,
    car: Car,
    another_car: Car,
) -> str:
    """
    Some long description of the function.
    """
    del yet_another_long_variable, another_car, car, another_long_variable
    return some_long_variable
