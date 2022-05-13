within ElectrolyteMedia.Media.SolidLiquidPhase.Common.MixtureLiquid;
function T_phX "calculates temperature of gas"
  extends Modelica.Icons.Function;

  input SI.AbsolutePressure p "Pressure";
  input SI.SpecificEnthalpy h "Specific Enthalpy";
  input MassFraction[:] X;

  output SI.Temperature T "Temperature";

protected
    package Internal
    "Solve h(data,T) for T with given h (use only indirectly via temperature_phX)"
    extends Media.Common.OneNonLinearEquation;

     redeclare function extends f_nonlinear
     algorithm
     y :=Functions.calc_h(
             x,
             p_,
             X_);
     end f_nonlinear;

    // Dummy definition has to be added for current Dymola
      redeclare function extends solve
      end solve;
    end Internal;

protected
  SI.Temperature Tmax = Modelica.Media.Water.IF97_Utilities.BaseIF97.Basic.tsat(p);

algorithm
  T := Internal.solve(
    h,
    273.15,
    Tmax,
    p,
    0,
    0,
    X);

  annotation(smoothOrder(normallyConstant = data)=20);
end T_phX;
