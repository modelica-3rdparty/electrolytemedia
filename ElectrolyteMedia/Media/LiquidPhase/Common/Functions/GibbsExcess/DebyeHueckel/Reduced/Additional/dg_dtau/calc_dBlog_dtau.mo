within ElectrolyteMedia.Media.LiquidPhase.Common.Functions.GibbsExcess.DebyeHueckel.Reduced.Additional.dg_dtau;
function calc_dBlog_dtau "Helper function to calculate Gibbs derivative"
  input SI.Temperature T;
  input SI.Pressure p;
  output Real dBlog_dT;

protected
  SI.Density rho = IF97_R1_Tp.calc_rho(T,p);
  Real eps = BornFunctions.calc_eps(T,p);
  Real e=Modelica.Constants.F/Modelica.Constants.N_A
    "electronic charge 1.602176621e-19";
  Real tau=calc_tau(T);
  Real drho_dT=IF97_R1_Tp.calc_der_rho_T(T, p);
  Real deps_dT=BornFunctions.calc_der_eps_T(T, p);
algorithm

  dBlog_dT := (2*e^2*Modelica.Constants.N_A/(Modelica.Constants.epsilon_0
    *Modelica.Constants.k*Tref))^0.5*(0.5*(tau*rho/eps)^
    (-0.5)*1/eps^2*((rho + (-Tref/tau)*drho_dT)*eps -
    rho*(-Tref/tau)*deps_dT));

end calc_dBlog_dtau;
