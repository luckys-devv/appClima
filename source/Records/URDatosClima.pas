unit URDatosClima;

interface



  type
    RDatosClima = record
      Zona: String;
      FechaHora: String;
      Temperatura: Double;
      VelViento: Double;
      Dia: Boolean;
      CodigoClima: Integer;
      TempMaxima: Double;
      TempMinima: Double;
      ProbLluvia: Double;
    end;


implementation

end.
