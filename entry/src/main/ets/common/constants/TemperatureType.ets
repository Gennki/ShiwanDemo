export class TemperatureType {
  type: number;
  temperature: number;

  constructor(type: number, temperature: number) {
    this.type = type;
    this.temperature = temperature;
  }

  static TEMP_180 = new TemperatureType(1, 180);
  static TEMP_210 = new TemperatureType(2, 210);
}