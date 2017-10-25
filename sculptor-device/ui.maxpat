{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 522.0, 336.0, 1241.0, 833.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 2,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-11",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-chop.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 434.0, 518.0, 1754.0, 833.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 8.0, 8.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-171",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1464.0, 304.0, 100.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.349121, 119.025024, 48.700867, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[16]",
											"parameter_shortname" : "live.menu[5]",
											"parameter_type" : 2,
											"parameter_enum" : [ "none", "+ size", "- size" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[11]"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-155",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1592.0, 240.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 192.045898, 75.0, 17.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[19]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "?",
									"texton" : "?",
									"varname" : "live.text[13]"
								}

							}
, 							{
								"box" : 								{
									"fgcolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"id" : "obj-148",
									"maxclass" : "rslider",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1472.0, 384.0, 32.0, 72.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 147.705566, 168.0, 24.0, 120.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-144",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1384.0, 192.0, 40.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.349121, 51.0, 30.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[19]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[7]"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-143",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1440.0, 232.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 116.487549, 75.0, 17.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[12]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "?",
									"texton" : "?",
									"varname" : "live.text[14]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-142",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1544.0, 240.0, 40.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 157.125977, 75.0, 30.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[18]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[8]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-141",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1384.0, 232.0, 40.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.349121, 75.0, 30.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[12]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[4]"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-138",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1464.0, 280.0, 56.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.349121, 97.025024, 43.0, 20.0 ],
									"style" : "",
									"text" : "fade"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-126",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1376.0, 128.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.349121, 1.0, 31.604889, 20.0 ],
									"style" : "",
									"text" : "into"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-121",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1376.0, 360.0, 72.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 14.349121, 147.0, 73.0, 20.0 ],
									"style" : "",
									"text" : "randomize",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-112",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1528.0, 392.0, 24.0, 56.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 183.938599, 168.0, 24.0, 120.0 ],
									"slidercolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"style" : "",
									"thickness" : 3
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-108",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1512.0, 160.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 173.787598, 25.5, 41.516998, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[15]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "triplet",
									"texton" : "triplet",
									"varname" : "live.text[11]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"id" : "obj-103",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1424.0, 152.0, 26.0, 25.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 106.987549, 23.0, 26.0, 25.0 ],
									"style" : "",
									"text" : "/",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-104",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1456.0, 160.0, 49.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 127.737549, 25.5, 39.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[7]",
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2,
											"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 2.0 ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[5]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-106",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1384.0, 160.0, 40.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.349121, 25.5, 30.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[15]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[6]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
									"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-62",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1576.0, 352.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 154.705566, 119.025024, 52.233032, 20.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[10]",
											"parameter_shortname" : "live.text[6]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "chop",
									"varname" : "live.text[7]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-38",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1496.0, 232.0, 32.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 137.477783, 75.0, 20.0, 20.0 ],
									"style" : "",
									"text" : "of"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-21",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1376.0, 280.0, 61.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.769531, 97.025024, 50.0, 20.0 ],
									"style" : "",
									"text" : "sustain"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-25",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1384.0, 304.0, 38.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.769531, 119.025024, 44.104248, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[9]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 100.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 5,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[5]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1528.0, 360.0, 24.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 184.938599, 146.0, 22.0, 20.0 ],
									"style" : "",
									"text" : "tilt",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1376.0, 72.0, 86.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 14.349121, 3.5, 44.638397, 20.0 ],
									"style" : "",
									"text" : "chop"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1376.0, 96.0, 100.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 14.349121, 25.5, 60.108002, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[6]",
											"parameter_shortname" : "live.menu[5]",
											"parameter_type" : 2,
											"parameter_enum" : [ "time", "number", "euclid" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[4]"
								}

							}
, 							{
								"box" : 								{
									"bottomvalue" : -100,
									"color" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"elementcolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"id" : "obj-17",
									"leftvalue" : -100,
									"maxclass" : "pictslider",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1376.0, 392.0, 72.0, 40.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 168.0, 120.0, 120.0 ],
									"rightvalue" : 100,
									"style" : "",
									"topvalue" : 100
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 20.0,
									"id" : "obj-151",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1480.0, 336.0, 40.0, 29.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 146.705566, 138.525024, 28.0, 29.0 ],
									"style" : "",
									"text" : "↔",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-154",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1480.0, 352.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 147.705566, 147.0, 24.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[18]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : " ",
									"texton" : " ",
									"varname" : "live.text[12]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 104.0, 512.0, 69.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 104.0, 464.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "newobjBlue-1",
								"default" : 								{
									"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjGreen-1",
								"default" : 								{
									"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjYellow-1",
								"default" : 								{
									"fontsize" : [ 12.059008 ],
									"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 816.0, 8.0, 264.0, 304.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 724.383179, 0.0, 260.383179, 304.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-10",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-set.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 400.0, 206.0, 1754.0, 833.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 8.0, 8.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-201",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1063.25, 116.0, 100.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 84.383179, 26.474976, 61.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[21]",
											"parameter_shortname" : "live.menu[1]",
											"parameter_type" : 2,
											"parameter_enum" : [ "deleted", "muted" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[16]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"id" : "obj-196",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1101.516846, 145.0, 25.0, 25.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 115.883179, 46.474976, 25.0, 25.0 ],
									"style" : "",
									"text" : "/",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-197",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1120.699951, 149.0, 49.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 135.883179, 49.974976, 39.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[20]",
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2,
											"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 2.0 ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[15]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-198",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1069.199951, 149.0, 39.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 84.383179, 49.974976, 35.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[24]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : -127.0,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[15]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-199",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1168.449951, 149.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 183.633179, 49.974976, 47.5, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[23]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "triplet",
									"texton" : "triplet",
									"varname" : "live.text[18]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
									"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-195",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1086.516846, 287.025024, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 146.870789, 168.0, 52.233032, 20.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[22]",
											"parameter_shortname" : "live.text[6]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "apply",
									"varname" : "live.text[17]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-194",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1069.199951, 171.5, 47.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 84.383179, 72.974976, 34.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[23]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 64.0 ],
											"parameter_unitstyle" : 8,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[14]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"id" : "obj-188",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1115.0, 227.0, 25.0, 25.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 116.766357, 121.474976, 25.0, 25.0 ],
									"style" : "",
									"text" : "/",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-189",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1144.400024, 231.0, 49.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 136.766357, 124.974976, 39.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[19]",
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2,
											"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 2.0 ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[14]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-190",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1069.199951, 231.0, 39.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 85.266357, 124.974976, 35.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[21]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[12]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-191",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1195.400024, 227.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 184.516357, 124.974976, 47.5, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[21]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "triplet",
									"texton" : "triplet",
									"varname" : "live.text[16]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-192",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 1069.199951, 199.0, 47.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 84.383179, 100.0, 34.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[22]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 64.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[13]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-179",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 968.0, 116.0, 61.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 26.474976, 61.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[18]",
											"parameter_shortname" : "live.menu[1]",
											"parameter_type" : 2,
											"parameter_enum" : [ "note", "start", "pitch", "velocity", "duration" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[13]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-153",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1063.25, 85.5, 65.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 84.383179, 4.474976, 40.383179, 20.0 ],
									"style" : "",
									"text" : "value",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-123",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 968.0, 271.0, 81.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 9.133179, 146.0, 73.0, 20.0 ],
									"style" : "",
									"text" : "randomize",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bottomvalue" : -100,
									"color" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"elementcolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"id" : "obj-95",
									"leftvalue" : -100,
									"maxclass" : "pictslider",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 968.0, 304.0, 75.0, 44.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 168.0, 120.0, 120.0 ],
									"rightvalue" : 100,
									"style" : "",
									"topvalue" : 100
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 979.0, 85.5, 64.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 4.474976, 67.5, 20.0 ],
									"style" : "",
									"text" : "set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 104.0, 512.0, 69.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 104.0, 464.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "newobjBlue-1",
								"default" : 								{
									"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjGreen-1",
								"default" : 								{
									"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjYellow-1",
								"default" : 								{
									"fontsize" : [ 12.059008 ],
									"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 552.0, 8.0, 256.0, 304.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 482.0, 0.0, 240.0, 296.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-8",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-slide.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 400.0, 206.0, 1754.0, 833.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 8.0, 8.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 104.0, 512.0, 69.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 104.0, 464.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"id" : "obj-133",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 211.5, 194.5, 25.0, 25.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 113.674774, 85.0, 25.0, 25.0 ],
									"style" : "",
									"text" : "/",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-134",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 243.0, 198.5, 49.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 133.424774, 87.5, 39.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[11]",
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2,
											"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 2.0 ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[2]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-135",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 166.450012, 194.5, 39.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.174774, 88.5, 35.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[17]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[1]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"id" : "obj-130",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 211.5, 102.5, 25.0, 25.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 113.424774, 16.5, 25.0, 25.0 ],
									"style" : "",
									"text" : "/",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-131",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 238.5, 102.5, 49.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 133.424774, 20.0, 39.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[10]",
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2,
											"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 2.0 ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[7]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-132",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 166.450012, 102.5, 39.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 81.924774, 20.0, 35.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[16]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 128.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[3]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-122",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 88.200012, 238.5, 73.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.383179, 133.0, 72.0, 20.0 ],
									"style" : "",
									"text" : "randomize",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-111",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 320.325348, 275.0, 45.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 176.291595, 136.0, 41.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[8]",
											"parameter_shortname" : "live.menu[5]",
											"parameter_type" : 2,
											"parameter_enum" : [ "mid", "min", "max" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[6]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-107",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 301.0, 198.5, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 175.291595, 87.5, 47.5, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[14]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "triplet",
									"texton" : "triplet",
									"varname" : "live.text[9]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-98",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 301.0, 102.5, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 175.291595, 20.0, 47.5, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[11]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "triplet",
									"texton" : "triplet",
									"varname" : "live.text[8]"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-56",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 93.200012, 166.5, 49.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 7.383179, 87.5, 38.0, 20.0 ],
									"style" : "",
									"text" : "edge"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-50",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 166.450012, 134.0, 47.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 81.924774, 43.5, 34.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[7]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 64.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[2]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-45",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 93.200012, 198.5, 46.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 8.383179, 108.5, 55.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[5]",
											"parameter_shortname" : "live.menu[5]",
											"parameter_type" : 2,
											"parameter_enum" : [ "clip", "reflect", "rotate", "-" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[3]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-42",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 93.200012, 102.5, 62.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 12.383179, 22.0, 63.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[1]",
											"parameter_shortname" : "live.menu[1]",
											"parameter_type" : 2,
											"parameter_enum" : [ "start", "pitch", "velocity", "duration" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[1]"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 93.200012, 77.0, 42.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 12.383179, 2.0, 35.0, 20.0 ],
									"style" : "",
									"text" : "slide"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 163.0, 72.0, 42.450012, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 81.924774, 2.975006, 44.458405, 20.0 ],
									"style" : "",
									"text" : "range"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-41",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 273.075348, 275.0, 33.749329, 50.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 176.291595, 154.0, 24.658417, 120.0 ],
									"slidercolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"style" : "",
									"thickness" : 3
								}

							}
, 							{
								"box" : 								{
									"bottomvalue" : -100,
									"color" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"elementcolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"id" : "obj-51",
									"leftvalue" : -100,
									"maxclass" : "pictslider",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 93.200012, 275.0, 82.0, 50.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 7.383179, 154.0, 120.0, 120.0 ],
									"rightvalue" : 100,
									"style" : "",
									"topvalue" : 100
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-63",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 207.125336, 275.0, 33.749329, 50.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 139.133179, 154.0, 24.5, 120.0 ],
									"slidercolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"style" : "",
									"thickness" : 3
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 273.075348, 244.0, 52.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 169.825012, 116.0, 53.933167, 20.0 ],
									"style" : "",
									"text" : "spread",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-27",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 213.625336, 244.0, 36.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 134.383179, 133.0, 35.0, 20.0 ],
									"style" : "",
									"text" : "shift",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 166.450012, 165.125, 47.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 82.174774, 67.5, 34.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[5]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 64.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "newobjBlue-1",
								"default" : 								{
									"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjGreen-1",
								"default" : 								{
									"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjYellow-1",
								"default" : 								{
									"fontsize" : [ 12.059008 ],
									"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 0.0, 8.0, 256.0, 280.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.383179, 0.0, 256.0, 280.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui-swap.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 3,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 400.0, 206.0, 1754.0, 833.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 8.0, 8.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 104.0, 512.0, 69.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 104.0, 464.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-172",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 634.674072, 191.0, 39.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 75.661194, 71.5, 24.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[13]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 64.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[11]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"id" : "obj-166",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 684.450012, 219.0, 25.0, 25.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 91.629211, 92.0, 25.0, 25.0 ],
									"style" : "",
									"text" : "/",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-167",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 707.874084, 223.0, 36.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 109.629211, 94.5, 30.968506, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[22]",
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2,
											"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64" ],
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 2.0 ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[10]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-168",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 634.674072, 223.0, 39.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 75.661194, 94.5, 24.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "velocity range[20]",
											"parameter_shortname" : "velrange",
											"parameter_type" : 1,
											"parameter_mmin" : 1.0,
											"parameter_mmax" : 64.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ 1.0 ],
											"parameter_unitstyle" : 0,
											"parameter_speedlim" : 5.0,
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "velrange[10]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-169",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 758.874084, 223.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 144.067566, 94.5, 37.998413, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[24]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "triplet",
									"texton" : "triplet",
									"varname" : "live.text[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-165",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 634.674072, 159.5, 46.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 75.661194, 51.5, 32.0, 20.0 ],
									"style" : "",
									"text" : "size"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-164",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 733.254272, 187.0, 43.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 144.067566, 71.5, 36.486755, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[23]",
											"parameter_shortname" : "live.menu[5]",
											"parameter_type" : 2,
											"parameter_enum" : [ "first", "last", "any", "new" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-163",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 733.254272, 155.5, 54.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 144.067566, 51.5, 44.473511, 20.0 ],
									"style" : "",
									"text" : "extras"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-162",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 542.47406, 155.5, 58.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 11.748199, 51.5, 61.0, 20.0 ],
									"style" : "",
									"text" : "group"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
									"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-156",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 689.0, 322.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 184.985596, 139.0, 44.486755, 20.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[25]",
											"parameter_shortname" : "live.text[6]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "pairs",
									"varname" : "live.text[15]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-139",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 542.47406, 180.125, 48.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 71.5, 47.32843, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[24]",
											"parameter_shortname" : "live.menu[5]",
											"parameter_type" : 2,
											"parameter_enum" : [ "notes", "time" ],
											"parameter_invisible" : 2
										}

									}
,
									"varname" : "live.menu[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-129",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 535.47406, 81.5, 49.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 3.0, 69.0, 20.0 ],
									"style" : "",
									"text" : "swap"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
									"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-110",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 697.75, 353.0, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 184.985596, 204.5, 44.486755, 20.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[26]",
											"parameter_shortname" : "live.text[6]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "zip",
									"varname" : "live.text[10]"
								}

							}
, 							{
								"box" : 								{
									"contdata" : 1,
									"id" : "obj-92",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 625.200012, 292.0, 33.749329, 50.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 148.704102, 136.0, 24.0, 120.0 ],
									"slidercolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"style" : "",
									"thickness" : 3
								}

							}
, 							{
								"box" : 								{
									"bottomvalue" : -100,
									"color" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"elementcolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
									"id" : "obj-93",
									"leftvalue" : -100,
									"maxclass" : "pictslider",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 520.200012, 299.0, 70.5, 43.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 136.0, 120.0, 120.0 ],
									"rightvalue" : 100,
									"style" : "",
									"topvalue" : 100
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"id" : "obj-37",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 607.949341, 268.5, 51.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 138.175537, 117.5, 47.0, 20.0 ],
									"style" : "",
									"text" : "rotate",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-64",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 597.47406, 116.5, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 70.237183, 22.975006, 50.631897, 18.049999 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[27]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "pitch",
									"texton" : "pitch",
									"varname" : "live.text[1]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-65",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 535.47406, 116.5, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 22.975006, 50.631897, 18.049999 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[28]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "start",
									"texton" : "start",
									"varname" : "live.text[5]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
									"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-44",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 689.0, 286.5, 40.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 184.985596, 171.5, 44.486755, 20.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[29]",
											"parameter_shortname" : "live.text[6]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "flip",
									"varname" : "live.text[4]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-43",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 714.674072, 120.0, 56.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 178.840454, 22.975006, 50.631897, 18.049999 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[30]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "duration",
									"texton" : "duration",
									"varname" : "live.text[3]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-40",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 653.47406, 120.0, 48.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 124.603271, 22.975006, 50.631897, 18.049999 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.text[31]",
											"parameter_shortname" : "live.text[2]",
											"parameter_type" : 2,
											"parameter_mmax" : 1.0,
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2
										}

									}
,
									"text" : "velocity",
									"texton" : "velocity",
									"varname" : "live.text[2]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"id" : "obj-16",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 516.700012, 272.0, 74.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 10.053253, 117.5, 71.0, 20.0 ],
									"style" : "",
									"text" : "randomize",
									"textjustification" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "newobjBlue-1",
								"default" : 								{
									"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjGreen-1",
								"default" : 								{
									"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjYellow-1",
								"default" : 								{
									"fontsize" : [ 12.059008 ],
									"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 264.0, 8.0, 272.0, 280.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 8.0, 240.0, 272.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 104.0, 512.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-1",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 104.0, 464.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-6",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 320.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 482.0, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-7",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 824.0, 328.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 724.383179, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-4",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 32.0, 320.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.383179, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.603922, 0.631373, 0.576471, 0.0 ],
					"id" : "obj-5",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 256.0, 312.0, 64.0, 64.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.0, 0.0, 240.0, 300.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-3::obj-168" : [ "velocity range[20]", "velrange", 0 ],
			"obj-8::obj-107" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-11::obj-155" : [ "live.text[19]", "live.text[2]", 0 ],
			"obj-11::obj-15" : [ "live.menu[6]", "live.menu[5]", 0 ],
			"obj-3::obj-65" : [ "live.text[28]", "live.text[2]", 0 ],
			"obj-8::obj-134" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-10::obj-199" : [ "live.text[23]", "live.text[2]", 0 ],
			"obj-3::obj-172" : [ "velocity range[13]", "velrange", 0 ],
			"obj-8::obj-111" : [ "live.menu[8]", "live.menu[5]", 0 ],
			"obj-10::obj-195" : [ "live.text[22]", "live.text[6]", 0 ],
			"obj-3::obj-43" : [ "live.text[30]", "live.text[2]", 0 ],
			"obj-11::obj-154" : [ "live.text[18]", "live.text[2]", 0 ],
			"obj-10::obj-194" : [ "velocity range[23]", "velrange", 0 ],
			"obj-8::obj-98" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-11::obj-143" : [ "live.text[12]", "live.text[2]", 0 ],
			"obj-3::obj-167" : [ "live.menu[22]", "live.menu", 0 ],
			"obj-11::obj-142" : [ "velocity range[18]", "velrange", 0 ],
			"obj-11::obj-141" : [ "velocity range[12]", "velrange", 0 ],
			"obj-11::obj-108" : [ "live.text[15]", "live.text[2]", 0 ],
			"obj-10::obj-197" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-8::obj-11" : [ "velocity range[5]", "velrange", 0 ],
			"obj-10::obj-198" : [ "velocity range[24]", "velrange", 0 ],
			"obj-11::obj-104" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-3::obj-169" : [ "live.text[24]", "live.text[2]", 0 ],
			"obj-11::obj-106" : [ "velocity range[15]", "velrange", 0 ],
			"obj-11::obj-171" : [ "live.menu[16]", "live.menu[5]", 0 ],
			"obj-3::obj-44" : [ "live.text[29]", "live.text[6]", 0 ],
			"obj-11::obj-62" : [ "live.text[10]", "live.text[6]", 0 ],
			"obj-3::obj-64" : [ "live.text[27]", "live.text[2]", 0 ],
			"obj-8::obj-132" : [ "velocity range[16]", "velrange", 0 ],
			"obj-10::obj-201" : [ "live.menu[21]", "live.menu[1]", 0 ],
			"obj-10::obj-189" : [ "live.menu[19]", "live.menu", 0 ],
			"obj-3::obj-164" : [ "live.menu[23]", "live.menu[5]", 0 ],
			"obj-10::obj-190" : [ "velocity range[21]", "velrange", 0 ],
			"obj-10::obj-191" : [ "live.text[21]", "live.text[2]", 0 ],
			"obj-10::obj-192" : [ "velocity range[22]", "velrange", 0 ],
			"obj-10::obj-179" : [ "live.menu[18]", "live.menu[1]", 0 ],
			"obj-11::obj-144" : [ "velocity range[19]", "velrange", 0 ],
			"obj-11::obj-25" : [ "velocity range[9]", "velrange", 0 ],
			"obj-8::obj-131" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-3::obj-139" : [ "live.menu[24]", "live.menu[5]", 0 ],
			"obj-3::obj-110" : [ "live.text[26]", "live.text[6]", 0 ],
			"obj-8::obj-50" : [ "velocity range[7]", "velrange", 0 ],
			"obj-8::obj-135" : [ "velocity range[17]", "velrange", 0 ],
			"obj-8::obj-45" : [ "live.menu[5]", "live.menu[5]", 0 ],
			"obj-3::obj-40" : [ "live.text[31]", "live.text[2]", 0 ],
			"obj-3::obj-156" : [ "live.text[25]", "live.text[6]", 0 ],
			"obj-8::obj-42" : [ "live.menu[1]", "live.menu[1]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "ui-swap.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-chop.maxpat",
				"bootpath" : "D:/workspace/ableton-midi-sculptor/sculptor-device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
