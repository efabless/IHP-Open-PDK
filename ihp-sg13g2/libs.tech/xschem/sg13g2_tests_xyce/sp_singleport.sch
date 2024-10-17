v {xschem version=3.4.5 file_version=1.2
* Copyright 2021 Stefan Frederik Schippers
* 
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     https://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.

}
G {}
K {}
V {}
S {}
E {}
T {Please review the file "sparam.s2p"
} 10 -680 0 0 0.5 0.5 {}
N 0 -260 0 -230 {
lab=GND}
N 0 -380 0 -320 {
lab=in}
N 690 -260 690 -230 {
lab=GND}
N 690 -380 690 -320 {
lab=out}
N 220 -260 220 -230 {
lab=GND}
N 220 -380 220 -320 {
lab=in}
N 830 -260 830 -230 {
lab=GND}
N 830 -380 830 -320 {
lab=out}
N 690 -390 690 -380 {
lab=out}
N 220 -400 220 -380 {
lab=in}
N 690 -380 830 -380 {
lab=out}
N -0 -380 220 -380 {
lab=in}
N 610 -260 610 -230 {
lab=GND}
N 610 -380 610 -320 {
lab=out}
N 330 -260 330 -230 {
lab=GND}
N 330 -380 330 -320 {
lab=in}
N 550 -380 610 -380 {
lab=out}
N 610 -380 690 -380 {
lab=out}
N 450 -380 490 -380 {
lab=#net1}
N 330 -380 390 -380 {
lab=in}
N 220 -380 330 -380 {
lab=in}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Copyright 2023 IHP PDK Authors"}
C {devices/gnd.sym} 220 -230 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 0 -230 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 690 -230 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 830 -230 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 220 -400 1 0 {name=p1 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 690 -390 1 0 {name=p2 sig_type=std_logic lab=out}
C {launcher.sym} 1060 -210 0 0 {name=h1
descr=SimulateXyce
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,3,cmd) \{Xyce -plugin $env(PDK_ROOT)/$env(PDK)/libs.tech/xyce/plugins/Xyce_Plugin_PSP103_VA.so \\"$N\\"\}

# change the simulator to be used (Xyce)
set sim(spice,default) 3

# run netlist and simulation
xschem netlist
simulate
"}
C {simulator_commands_shown.sym} 990 -370 0 0 {name=Simulator
simulator=xyce
only_toplevel=false 
value="
.preprocess replaceground true
.option temp=27
.ac lin 1001 1e6 1e9
.lin format=touchstone file=sparam.s2p
"
"}
C {sg13g2_tests_xyce/portsource.sym} 0 -290 0 0 {name=P3 value="port=1 z0=50 ac 1" savecurrent=false}
C {sg13g2_tests_xyce/portsource.sym} 830 -290 0 0 {name=P5 value="port=2 z0=50 ac 0" savecurrent=false}
C {devices/gnd.sym} 610 -230 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 330 -230 0 0 {name=l7 lab=GND}
C {capa.sym} 420 -380 1 0 {name=C1
m=1
value=2.419p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 330 -290 0 0 {name=C2
m=1
value=25.406p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 610 -290 0 0 {name=C3
m=1
value=25.406p
footprint=1206
device="ceramic capacitor"}
C {ind.sym} 220 -290 0 0 {name=L8
m=1
value=4.154n
footprint=1206
device=inductor}
C {ind.sym} 690 -290 0 0 {name=L9
m=1
value=4.154n
footprint=1206
device=inductor}
C {ind.sym} 520 -380 1 0 {name=L10
m=1
value=43.636n
footprint=1206
device=inductor}
