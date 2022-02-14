abstract class Enum<T> {
  const Enum._fromValue(this.value);

  final T value;

  @override
  String toString();
}

class PositionGroupEnum extends Enum<String> {
  factory PositionGroupEnum(final String? value) {
    if (value == 'Goleiros') {
      return PositionGroupEnum.goalkeepers;
    } else if (value == 'Zagueiros') {
      return PositionGroupEnum.defenders;
    } else if (value == 'Laterais') {
      return PositionGroupEnum.siders;
    } else if (value == 'Meias') {
      return PositionGroupEnum.midfields;
    } else if (value == 'Atacantes') {
      return PositionGroupEnum.attacks;
    }

    return PositionGroupEnum.Init;
  }

  const PositionGroupEnum._fromValue(final String value)
      : super._fromValue(value);

  static const PositionGroupEnum Init = PositionGroupEnum._fromValue('');

  static const PositionGroupEnum goalkeepers =
      PositionGroupEnum._fromValue('Goleiros');
  static const PositionGroupEnum defenders =
      PositionGroupEnum._fromValue('Zagueiros');
  static const PositionGroupEnum siders =
      PositionGroupEnum._fromValue('Laterais');
  static const PositionGroupEnum midfields =
      PositionGroupEnum._fromValue('Meias');
  static const PositionGroupEnum attacks =
      PositionGroupEnum._fromValue('Atacantes');

  @override
  String toString() => value.toString();
}
