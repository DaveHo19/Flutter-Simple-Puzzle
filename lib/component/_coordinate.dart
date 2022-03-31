class Coordinate {
  const Coordinate({required this.x, required this.y});
  final int x;
  final int y;

  bool isSame(Coordinate items) => ((x == items.x) && (y == items.y));

  bool isInvalid(int max){
    if (x.isNegative || y.isNegative){
      return false;
    } 
    if (x >= max || y >= max){
      return false;
    }

    return true;
  } 
  bool isSmaller(Coordinate items) {
    if (x < items.x) {
      return true;
    } 
    else if (x == items.x) {
      if (y < items.y) {
        return true;
      } 
      else if (y > items.y) {
        return false;
      }
    } 
    else if (x > items.x) {
      return false;
    }
    return false;
  }

  int getValue () => int.parse(x.toString()+y.toString());

  @override
  String toString() {
    return "($x, $y)";
  }
}
