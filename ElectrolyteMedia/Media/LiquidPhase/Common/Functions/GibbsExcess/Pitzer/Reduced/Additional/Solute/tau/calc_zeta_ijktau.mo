within ElectrolyteMedia.Media.LiquidPhase.Common.Functions.GibbsExcess.Pitzer.Reduced.Additional.Solute.tau;
function calc_zeta_ijktau "Helper function to calculate Gibbs derivative"
  input Modelica.SIunits.Temperature T;
  output Real[nLifun,nLifun,nLifun] zeta_ijk;
protected
  Real tau = calc_tau(T);
algorithm
  zeta_ijk := -Tref/tau^2*(-interactionfun.zeta_ijk[:,:,:,2]*(1/T^2) + interactionfun.zeta_ijk[:,:,:,3]*1/T + interactionfun.zeta_ijk[:,:,:,4] + interactionfun.zeta_ijk[:,:,:,5]*(2*T) + interactionfun.zeta_ijk[:,:,:,6]*(-2/T^3) + interactionfun.zeta_ijk[:,:,:,7]*3*T^2 + interactionfun.zeta_ijk[:,:,:,8]*(-1)/(T-263)^(2));

end calc_zeta_ijktau;
