(scale_analysis)=
# Week 2 and 3: Scale Analysis 
## Governing Equation on a Sphere 
### Spherical Coordinate
To gain a clearer understanding of tropical dynamics, we will begin by analyzing the governing equations relevant to the tropics. Typically, two types of governing equations are used: (1) primitive equations on a sphere and (2) primitive equations on a beta plane. The first approach accounts for the geometric effects as we move from lower to higher latitudes, requiring area weighting to ensure the conservation laws hold. In contrast, the beta plane approximation treats areas across different latitudes as equal.

We'll start with a simplified version of the primitive equations.


```{math}
:label: primitive
\begin{cases} 
\rho \frac{D \mathbf{u}}{Dt} = -\rho \nabla p + \rho \mathbf{g} -\rho 2\mathbf{\Omega}\times \mathbf{u} +\mathbf{F} \\
\frac{D \rho }{Dt} = -\rho \nabla \cdot  \mathbf{u} \\
c_p \frac{D \mathrm{ln}\theta}{Dt} = \frac{Q}{T} \\ 
p = \rho R T
\end{cases}
```
The first equation in {eq}`primitive` represents the three-dimensional momentum equation, where $\mathbf{u}$ denotes the three-dimensional momentum, $\rho$ is the density, $\mathbf{\Omega}$ is the Coriolis torque (expressed in terms of angular frequency, $7.292\times 10^{-5}$), and $\mathbf{F}$ represents the viscous or turbulent stresses. The second equation describes mass continuity, where changes in Lagrangian density are governed by the local convergence or divergence of flow (if the flow is three-dimensional incompressible, then the right-hand side of the second equation in {eq}`primitive` will be zero). The third equation is the thermodynamic equation, where $\theta$ (defined as $T(\frac{p_0}{p})^{\kappa}$, with $p_0=1000$hPa) is the potential temperature, $Q$ is the diabatic heating rate, and $T$ is the temperature. The final equation is the equation of state, where $R$ is the ideal gas constant.

Here, we introduce the first assumption: the Earth's atmosphere is relatively shallow compared to its radius, and the surface is nearly a geopotential surface (i.e., a surface perpendicular to the effective gravity). Considering the Earth's geometry, the equation simplifies to a PDE problem on a sphere. 


```{figure} ../tropical-dynamics-figures/spherical_coordinate.png
---
name: FIG2-1
---
Coordinate variables defined on a sphere.
```

```{math}
:label: primitive2
\begin{cases} 
\frac{Du}{Dt} - \frac{uv \mathrm{tan}(\phi)}{a}+\frac{uw}{a} = -\frac{1}{\rho a \mathrm{cos}(\phi)} \frac{\partial p}{\partial \lambda}+2\Omega v \mathrm{sin}\phi-2\Omega w \mathrm{cos}(\phi) \\
\frac{Dv}{Dt} + \frac{u^2 \mathrm{tan}(\phi)}{a}+\frac{vw}{a} =   -\frac{1}{\rho a } \frac{\partial p}{\partial \phi}-2\Omega u \mathrm{sin}(\phi) \\
\frac{Dw}{Dt} -\frac{u^2+v^2}{a} = -\frac{1}{\rho}\frac{\partial p}{\partial z} - g + 2\Omega u  \mathrm{cos}(\phi) \\
\frac{D\rho}{Dt} = -\frac{\rho}{a\mathrm{cos}(\phi)} \frac{\partial u}{\partial \lambda}+\frac{\partial }{\partial \phi}(v\mathrm{cos}(\phi))-\rho\frac{\partial w}{\partial z}-2\rho \frac{w}{a}
\end{cases}
```

where a is the radius of the Earth (6371km) and $\frac{D}{Dt}=\frac{\partial }{\partial t}+\mathbf{u}\cdot \nabla$. 


<!-- :::{admonition} Example 1
From {eq}`primitive` to {eq}`primitive2`, one can find the Coriolis force change from $\mathbf{\Omega} \times \mathbf{u}$ to a few $2\Omega \mathrm{sin}(\phi)$, $2\Omega \mathrm{cos}(\phi)$ terms. 
This can be derived from the definition of Coriolis force. 

```{math}
:label: Coriolis1
\begin{align}
\mathbf{F}_{\Omega} &= -\mathbf{\Omega}\times(\mathbf{\Omega}\times \mathbf{v}) \\
                    &= (\Omega^2 r \mathrm{cos}\phi ) \mathbf{e_\lambda}\times \mathbf{e_{\Omega}} \\ 
                    &=\Omega^2\mathbf{r_e}
\end{align}
```
where 
```{math}
:label: Coriolis2
\begin{align}
\Omega^2\mathbf{r_e} &=\nabla [\frac{1}{2}|\mathbf{\Omega}\times r|^2] 
\end{align}
```

::: -->

### Hydrostatic Assumption
The second assumption introduced here is the hydrostatic approximation, which is a robust assumption at scales larger than $\sim $20km. To see how it works, we first rewrite the third equation of {eq}`primitive2`. 

```{math}
:label: hydrostatic
\underbrace{\frac{Dw}{Dt}}_{\frac{W}{\tau}}+ \underbrace{\frac{1}{\rho}\frac{\partial p}{\partial z}}_{\frac{\delta p}{\rho D}} - \underbrace{\sigma}_{\Sigma} = \underbrace{\frac{u^2+v^2}{a}}_{\frac{U^2}{a}}+\underbrace{2\Omega u \mathrm{cos}(\phi)}_{2\Omega U}
```
$\rho = -g \frac{\rho-\rho_0(z)}{\rho}$ represents the reduced gravity, where $\rho_0(z)$ corresponds to the portion of the pressure gradient force that is balanced by gravity. Consequently, vertical acceleration occurs when there is a slight imbalance, specifically when $\rho-\rho_0(z)$ is nonzero. The variables in {eq}`hydrostatic` can be substituted with their characteristic scales. (the underbrace of {eq}`hydrostatic`). 

For value of $\delta p \sim 10^2$hPa (pressure deviate from the hydrostatic balance, not the actual pressure) over the troposphere depth (20km), $\frac{\delta p}{\rho D}\sim 10^2 \text{hPa}/(1 \frac{\text{kg}}{\text{ms}}\cdot2\cdot10^4 \text{m})\sim 5\times 10^{-2}m\cdot s^{-1}$. Also, $U \sim 10m\cdot s^{-1}$, $\Omega \sim 10^{-5} s^{-1}$ and $a\sim 10^6$. $\Sigma$ has an order aorund $10^{-2}$ (gravity is reduced to one hundredth). The last two terms are relatively small and negligible. Thus, the only question remains whether $\frac{Dw}{Dt}$ is small enough to be omitted?

Now consider, 
```{math}
:label: scaling_2
\frac{Dw}{Dt}/ (\frac{1}{ \rho}\frac{\partial p}{\partial z}) = |\frac{W}{\tau}/\frac{\delta p}{\rho D}| 
```

We can obtain $\delta p$ from the first equation of {eq}`primitive2`. 


```{math}
:label: scaling_3
\delta p = \frac{\rho U L }{t}
```

This will yield two different time scales (1) in the case of quasigeostrophic $\frac{1}{\tau}<< f$ or (2) $\frac{1}{\tau}>> f$. In the first case (1)


```{math}
:label: scaling_4
\delta p \approx P_1 = \rho U L f
```


given the major pressure perturbation happens in the horizontal direction. 

As for the second case, we have 
```{math}
:label: scaling_5
\delta p \approx P_2 = \frac{\rho U L }{\tau} 
```
where the main pressure perturbation happens in vertical direction. 


In the low-frequency limit (case 1), ($1/\tau << f$ or $1 << f\tau$). {eq}`scaling_3` becomes 

```{math}
:label: scaling_6
|\frac{W}{\tau}/\frac{\delta p}{\rho D}| = |\frac{W}{\tau}/\frac{P_1}{\rho D}| = |\frac{W}{\tau}/\frac{fUL}{D}|
```

in this condition, even if $W\sim U$ and $D\sim L$ (i.e., $|\frac{W}{\tau}/\frac{\delta p}{\rho D}| \approx |\frac{1}{\tau}/f|$), we still get $\frac{W}{\tau}$ is much smaller than the pressure gradient force. Thus, the acceleration of vertical motion can be neglected. aka the hydrostatic balance is a solid assumption under the assumption of quasigeostrophic balance. One should be careful that {eq}`primitive2` has a component of $2\Omega \omega \mathrm{cos}\phi$ that is maximum at the equator! But to keep the entire equation mathematically consistent, we have to drop it (otherwise the total energy is not conserved under the hydrostatic assumption). This can shown by calculating the total kinetic energy i.e., 

```{math}
:label: hydrostatic_KE
\frac{1}{2}\frac{D}{Dt} [u^2+v^2] = -\frac{1}{\rho}[\frac{u}{a\mathrm{cos}\phi}\frac{\partial p }{\partial \lambda}+\frac{v}{a}\frac{\partial p}{\partial \phi}]-[2\Omega u\omega\mathrm{cos}\phi-(\frac{u^2+v^2}{a}\omega)]
```

Integrating over the entire domain, one can find that the first term on the right-hand-side of {eq}`hydrostatic_KE` will vanish while the second term does not. This means we have to drop $2\Omega u\omega\mathrm{cos}\phi$ and $(\frac{u^2+v^2}{a}\omega)$ to make the total kinetic energy conserved.   


As for the high-frequency limit, the hydrostatic assumption only holds when $W<<U$ and $D/L<<1$. Thus, considering both scenarios, we should adopt constraints in high-frequency limits.  

## Weak temperature gradient

Now consider a hydrostatic equation at low latitude, we will take a further step and see which term can be neglected. 
```{math}
:label: scaling_6
\begin{align}
(\frac{\partial }{\partial t}+\mathbf{u}\cdot\nabla_h)\mathbf{u}+w\frac{\partial}{\partial z}+\mathbf{f}\times \mathbf{u} &= -\frac{1}{\rho}\nabla_h p \\
0 &= -\frac{1}{\rho}\frac{\partial p}{\partial z}-g \\
(\frac{\partial }{\partial t}+\mathbf{u}\cdot\nabla_h)\rho +\rho\nabla_h \cdot \mathbf{u} +\frac{\partial}{\partial z} (\rho w) &= 0 \\
(\frac{\partial }{\partial t}+\mathbf{u}\cdot\nabla_h) \mathrm{ln}\theta + w \frac{\partial }{\partial z} \mathrm{ln}\theta &= \frac{Q}{c_p T}
\end{align}
```

We recognize that the perturbation in pressure and density is relatively small compared to the basic state but we need a more precise estimate of their order to decide whether to drop those terms or not. Here we define a pressure height (i.e., log-pressure coordinate). $\frac{1}{H_p} = -(1/p_0)(\frac{d p_0}{dz})$. With QG assumption, we have {eq}`scaling_4`, whereupon 

```{math}
:label: QG_hydrostatic
\frac{\delta p}{p_0} \approx \frac{\rho U fL}{H_p\frac{dp_0}{dz}} \approx \frac{ fU L}{gH_p} = \frac{F^2}{R_0}
```
where $F$ is Froude number and $R_0$ is Rossby number. {eq}`QG_hydrostatic` shows that the ratio between perturbation pressure and basic state pressure is about the scale of geostrophic flow squared divided by the squared external gravity wave speed. i.e., $\sim 0.01$. (i.e., in extratropics, the characteristic scale of $F^2\sim 10^{-3}$ and $R_0\sim 10^{-1}$). 


Over the tropics, the pressure perturbation under the hydrostatic assumption can be written as 
```{math}
:label: tropics_hydrostatic1
\frac{\delta \rho}{\rho_0} \approx \frac{\delta p}{gD\rho_0} \approx \frac{\delta p}{p} (\frac{H_p}{D}) \approx \frac{\delta p}{p_0} = \frac{F^2}{R_0}
```

$\frac{\delta \rho}{\rho_0}$ is reduced factor of gravitational acceleration. This can be derived given $\frac{\partial p'}{\partial z}=-g\rho'\rightarrow \frac{\delta p}{D}\approx g\delta\rho$. One can find {eq}`tropics_hydrostatic1` and {eq}`QG_hydrostatic` give us the same scaling. In general, F doesn't change much from tropics to extratropics. Thus, what really changes the order of scaling comes from Rossby number. Given the tropical $f\sim 10^{-5}$, $\frac{F^2}{R_0}$ will be around the order of $10^{-3}$. 

As for $\theta'$, one can also have the same exercise. (I will leave it to the readers). 


:::{note}
One might wonder why we care about reduced gravity in horizontal direction. This can be found in the following schematic plot. 

```{figure} ../tropical-dynamics-figures/reduced_gravity.PNG
---
name: FIG2-2
---
How the counteracting pressure gradient force makes gravity reduced. 
```

If today we have an air parcel sitting in the location of black dot. The horizontal pressure gradient force that air parcel feels can be written as 
```{math}
:label: reduced_gravity1
\rho a = [(\rho+\delta \rho) g (H-\overline{\eta})+\rho g (\eta(x_1))] - [\rho g \overline{\eta}] = \delta \rho g (\eta(x_1)-\overline{\eta})
```
Where $a$ is the acceleration of air parcel by pressure gradient force. 
one can find that the pressure gradient force is $\delta \rho g (\eta(x_1)-\eta)$ instead of $\delta \rho g (\eta(x_1))$. This is because the fluid above provides an counteract pressure gradient force (from the right to the left) makes the overall pressure gradient force small! If we divide both sides of equations by $\rho$, one can have 

```{math}
:label: reduced_gravity2
a = (\frac{\delta \rho}{\rho} g) (\eta(x_1)-\eta)
```

where the first term on the right hand side is so-called reduced gravity. An alternative representation is "equivalent depth", where $H'=\frac{\delta \rho}{\rho} (\eta(x_1)-\eta)$. The "height" that causes the pressure gradient is not as big as we originally thought but "equivalent to" a somewhat shallower height. In the later section, we will see why it's important having such shallowness.    
:::


The weak temperature gradient over the 



