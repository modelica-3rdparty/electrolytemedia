within ElectrolyteMedia.Media.LiquidPhase.Common.Functions.IF97_R1_Tp;
function calc_g
  "Calculates specific Gibbs free energy of water with IF97 model and standard state reference"
  input SI.Temperature T;
  input SI.Pressure p;
  output SI.SpecificGibbsFreeEnergy gibbs;
protected
  GibbsDerivs g = Reduced.GibbsDerivs(T,p);
  ThermoProperties_pT pro;
algorithm
  pro :=Modelica.Media.Common.ThermoFluidSpecial.gibbsToProps_pT(g);
  gibbs :=StdRefH2O.g_tr + pro.h - (T * (pro.s + StdRefH2O.s_tr) - StdRefH2O.T_tr * StdRefH2O.s_tr);

  annotation(smoothOrder=5);
end calc_g;
