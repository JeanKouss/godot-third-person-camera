# Godot Third Person Camera

<p align="center">
  <a href="https://godotengine.org">
	<img src="TPC-readme-assets/ThirdPersonCamera.svg" width="200" alt="Godot Engine logo">
  </a>
</p>

<p align="center">
  <video controls>
	<source src="TPC-readme-assets\TPC-demo-video.mp4" type="video/mp4">
  </video>
</p>

![Demo Video](TPC-readme-assets\TPC-demo-video.mp4)

A Third Person Camera for Godot4.

[![Status](https://img.shields.io/badge/status-active-success.svg)](Status)
[![GitHub Issues](https://img.shields.io/github/issues/JeanKouss/godot-third-person-camera)](https://github.com/JeanKouss/godot-third-person-camera/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/JeanKouss/godot-third-person-camera)](https://github.com/JeanKouss/godot-third-person-camera/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

## 📝 Table of Contents

- [Godot Third Person Camera](#godot-third-person-camera)
  - [📝 Table of Contents](#-table-of-contents)
  - [🏁 About](#-about)
  - [🏁 Documentation](#-documentation)
	- [Third Person Camera Configuration Properties](#third-person-camera-configuration-properties)
	  - [Distance From Pivot](#distance-from-pivot)
	  - [Pivot Offset](#pivot-offset)
	  - [Dive angle](#dive-angle)
	  - [Tilt upper limit](#tilt-upper-limit)
	  - [Tilt lower limit](#tilt-lower-limit)
	  - [Tilt sensitiveness](#tilt-sensitiveness)
	  - [Horizontal rotation sensitiveness](#horizontal-rotation-sensitiveness)
	  - [Current](#current)
	  - [Mouse Follow](#mouse-follow)
	  - [Mouse X sensitiveness](#mouse-x-sensitiveness)
	  - [Mouse Y sensitiveness](#mouse-y-sensitiveness)
	  - [Camera tilt](#camera-tilt)
	  - [Camera horizontal rotation](#camera-horizontal-rotation)
	- [Camera3D Properties](#camera3d-properties)

## 🏁 About<a id = "about"></a>

Here is a quick demo

## 🏁 Documentation<a id = "doc"></a>

### Third Person Camera Configuration Properties

#### Distance From Pivot

- Property name : `distance_from_pivot`
- Type : `float`
- Exported : Yes

![Distance from pivot demo](TPC-readme-assets/doc/distance_from_pivot.gif)

#### Pivot Offset

- Property name : `pivot_offset`
- Type : `Vector2`
- Exported : Yes

![Pivot offset demo](TPC-readme-assets/doc/pivot_offset.gif)

#### Dive angle

- Property : `initial_dive_angle_deg`
- Type : `float`
- Exported : Yes
- Range : -90.0 .. 90.0

![Dive angle demo](TPC-readme-assets/doc/dive_angle_demo.gif)

#### Tilt upper limit

- Property : `tilt_upper_limit_deg`
- Type : `float`
- Exported : Yes
- Range : -90.0 .. 90.0

#### Tilt lower limit

- Property : `tilt_lower_limit_deg`
- Type : `float`
- Exported : Yes
- Range : -90.0 .. 90.0

#### Tilt sensitiveness

- Property : `tilt_sensitiveness`
- Type : `float`
- Exported : Yes
- Range : 1.0 .. 100.0

![Tilt sensitiveness demo](TPC-readme-assets/doc/tilt_sensitiveness.gif)
  
#### Horizontal rotation sensitiveness

- Property : `horizontal_rotation_sensitiveness`
- Type : `float`
- Exported : Yes
- Range : 10.0 .. 700.0

![Horizontal rotation sensitiveness demo](TPC-readme-assets/doc/horizontal_rotation_sensitiveness.gif)

#### Current

- Property : `current`
- Type : `bool`
- Exported : Yes

![Camera current demo](TPC-readme-assets/doc/camera_current_demo.gif)

#### Mouse Follow

- Property : `mouse_follow`
- Type : `bool`
- Exported : Yes

![Mouse follow demo](TPC-readme-assets/doc/mouse_follow_demo.gif)

#### Mouse X sensitiveness

- Property : `mouse_x_sensitiveness`
- Type : `float`
- Exported : Yes
- Range : 0.0 .. 5.0

#### Mouse Y sensitiveness

- Property : `mouse_x_sensitiveness`
- Type : `float`
- Exported : Yes
- Range : 0.0 .. 2.0

#### Camera tilt

- Property : `camera_tilt_deg`
- Type : `float`
- Exported : *No*
- Range : `tilt_lower_limit_deg` .. `tilt_upper_limit_deg`

#### Camera horizontal rotation

- Property : `camera_horizontal_rotation_deg`
- Type : `float`
- Exported : *No*

### Camera3D Properties

All Godot `Camera3D` Properties are available. You can access to camera node by `get_camera()` method. Also, it exported variables are available in the editor.

![Camera3D properties image](TPC-readme-assets/doc/inspector.png)
