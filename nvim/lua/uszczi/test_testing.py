import pytest

@pytest.fixture(scope="function")
def foo(request):
    return request.param

@pytest.mark.parametrize("foo", [((2,1,3), (1,3))], indirect=True)
def test_foo(foo):
    print(foo)
    assert False

