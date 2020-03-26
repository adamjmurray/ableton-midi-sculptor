{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 1764.0, 560.0, 417.0, 652.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
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
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 819.732055999999943, 222.0, 33.0, 22.0 ],
					"text" : "float"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1056.0, 353.0, 150.0, 34.0 ],
					"presentation_linecount" : 2,
					"text" : "zoom doesn't work when nogrow is enabled"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 401.0, 127.0, 36.0 ],
					"presentation_linecount" : 2,
					"text" : "window flags nogrow, window exec"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1032.0, 401.0, 115.0, 36.0 ],
					"presentation_linecount" : 2,
					"text" : "window flags grow, window exec"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "float", "bang" ],
					"patching_rect" : [ 819.732055999999943, 262.0, 157.0, 22.0 ],
					"text" : "t b f b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 24.0,
					"id" : "obj-21",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 328.865295000000003, 145.0, 86.0, 89.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 28.5, 101.875, 210.0, 34.0 ],
					"text" : "Select a MIDI clip",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.101961, 0.0, 0.0, 0.85098 ],
					"id" : "obj-2",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 305.950012000000015, 141.0, 92.0, 79.0 ],
					"presentation" : 1,
					"presentation_rect" : [ -0.75, 0.375, 292.0, 255.0 ],
					"proportion" : 0.292271,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 990.232055999999943, 212.0, 107.0, 22.0 ],
					"text" : "window_height $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 872.232055999999943, 212.0, 102.0, 22.0 ],
					"text" : "window_width $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 990.232055999999943, 79.5, 31.0, 22.0 ],
					"text" : "250"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 872.232055999999943, 69.0, 31.0, 22.0 ],
					"text" : "285"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.439216, 0.74902, 0.254902, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 929.0, 13.5, 60.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 844.232055999999943, 172.0, 63.0, 22.0 ],
					"text" : "delay 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 699.0, 178.5, 42.0, 22.0 ],
					"text" : "* 300."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 638.0, 178.5, 42.0, 22.0 ],
					"text" : "* 300."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 786.0, 29.5, 78.0, 20.0 ],
					"text" : "zoom the UI"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-16",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 746.0, 20.0, 34.0, 34.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 872.232055999999943, 337.0, 52.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "zoom",
						"parameter_enable" : 0
					}
,
					"text" : "js zoom"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 699.0, 340.5, 127.0, 22.0 ],
					"text" : "route contrast_frame"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 699.0, 302.5, 62.0, 22.0 ],
					"text" : "r ---colors"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 699.0, 380.5, 139.0, 22.0 ],
					"text" : "prepend locked_bgcolor"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 242.0, 734.0, 1106.0, 518.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
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
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 492.0, 165.0, 135.0, 22.0 ],
									"text" : "route lcd_control_fg_alt"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 307.0, 147.0, 161.0, 22.0 ],
									"text" : "route lcd_control_fg_zombie"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 53.0, 248.0, 117.0, 22.0 ],
									"text" : "prepend textoncolor"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 183.0, 248.0, 103.0, 22.0 ],
									"text" : "prepend textcolor"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 113.0, 147.0, 77.0, 22.0 ],
									"text" : "route lcd_bg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 473.0, 248.0, 142.0, 22.0 ],
									"text" : "prepend activebgoncolor"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 307.0, 248.0, 129.0, 22.0 ],
									"text" : "prepend activebgcolor"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 307.0, 359.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 668.0, 248.0, 109.0, 22.0 ],
									"text" : "prepend bgfillcolor"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 668.0, 157.0, 123.0, 22.0 ],
									"text" : "route control_text_bg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 804.0, 140.0, 97.0, 22.0 ],
									"text" : "route control_bg"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 462.0, 23.0, 62.0, 22.0 ],
									"text" : "r ---colors"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 804.0, 248.0, 109.0, 22.0 ],
									"text" : "prepend bgfillcolor"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-13",
									"index" : 3,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 804.0, 359.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-14",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 668.0, 359.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"order" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 1,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"order" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"order" : 1,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"order" : 2,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"order" : 4,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"order" : 3,
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 230.0, 8.0, 69.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p r---colors"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 431.0, 29.5, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "ui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 36.0, 246.0, 165.0, 184.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 18.0, 36.25, 241.0, 187.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.333333, 0.333333, 0.333333, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 139.0, 116.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 29.375, 249.0, 192.625 ],
					"proportion" : 0.39,
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 305.950012000000015, 62.0, 92.0, 22.0 ],
					"text" : "r ---is_midi_clip"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 305.950012000000015, 105.0, 63.0, 22.0 ],
					"text" : "hidden $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 36.0, 138.0, 43.0, 22.0 ],
					"text" : "* -240"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 36.0, 189.0, 66.0, 22.0 ],
					"text" : "offset $1 0"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.54902, 0.54902, 0.54902, 1.0 ],
					"activebgoncolor" : [ 0.427451, 0.843137, 1.0, 1.0 ],
					"bordercolor" : [ 0.862745, 0.870588, 0.878431, 0.0 ],
					"focusbordercolor" : [ 0.862745, 0.870588, 0.878431, 0.0 ],
					"fontface" : 3,
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "live.tab",
					"num_lines_patching" : 1,
					"num_lines_presentation" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 36.0, 54.0, 213.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.0, 2.375, 245.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.tab[3]",
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 2,
							"parameter_mmax" : 2,
							"parameter_initial" : [ 0 ],
							"parameter_shortname" : "live.tab",
							"parameter_enum" : [ "slide", "swap", "set" ],
							"parameter_type" : 2,
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.117647, 0.117647, 0.117647, 1.0 ],
					"textoncolor" : [ 0.117647, 0.117647, 0.117647, 1.0 ],
					"varname" : "live.tab[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.5, 268.0, 98.0, 20.0 ],
					"text" : "for developing:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 542.315307999999959, 172.0, 38.0, 22.0 ],
					"text" : "- 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 503.815308000000016, 172.0, 31.0, 22.0 ],
					"text" : "- 75"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 621.232055999999943, 226.5, 41.0, 22.0 ],
					"text" : "+ 300"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 569.398682000000008, 226.5, 41.0, 22.0 ],
					"text" : "+ 300"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 503.815308000000016, 226.5, 29.5, 22.0 ],
					"text" : "t i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 503.981934000000024, 269.5, 136.250122000000005, 22.0 ],
					"text" : "pack i i i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 479.315308000000016, 69.0, 34.0, 22.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "int", "int", "int", "int", "int" ],
					"patching_rect" : [ 465.315308000000016, 133.5, 173.000060999999988, 22.0 ],
					"text" : "mousestate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 516.315307999999959, 23.5, 61.0, 34.0 ],
					"presentation_linecount" : 2,
					"text" : "open this window"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-74",
					"linecount" : 5,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 503.981934000000024, 302.5, 147.0, 77.0 ],
					"presentation_linecount" : 5,
					"text" : "window flags nomenu, window flags float, window size $1 $2 $3 $4, window flags nogrow, window exec, front"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 699.0, 486.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-77",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 479.315308000000016, 13.5, 34.0, 34.0 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.196078, 0.196078, 0.196078, 1.0 ],
					"id" : "obj-66",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 116.0, 92.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.0, 23.0, 263.299987999999985, 204.0 ],
					"proportion" : 0.39
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-10", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 1 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.65098, 0.65098, 0.65098, 0.0 ],
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-15", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.65098, 0.65098, 0.65098, 0.0 ],
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-15", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 2,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"order" : 1,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"order" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 1 ],
					"order" : 1,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 1 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-11", 1 ],
					"order" : 1,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-32", 0 ],
					"order" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-52", 1 ],
					"order" : 2,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"order" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"order" : 1,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-22", 1 ],
					"order" : 1,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-31", 1 ],
					"order" : 2,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-33", 0 ],
					"order" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"order" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 3 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 2 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-61", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-69", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-69", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-23", 0 ],
					"order" : 1,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.67451, 0.819608, 0.572549, 1.0 ],
					"destination" : [ "obj-27", 0 ],
					"order" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1::obj-11::obj-5::obj-144" : [ "velocity range[19]", "velrange", 0 ],
			"obj-1::obj-10::obj-4::obj-4" : [ "live.text[1]", "live.text[2]", 0 ],
			"obj-1::obj-11::obj-5::obj-142" : [ "velocity range[18]", "velrange", 0 ],
			"obj-1::obj-3::obj-44" : [ "live.text[6]", "live.text[6]", 0 ],
			"obj-1::obj-10::obj-4::obj-3" : [ "velocity range[10]", "velrange", 0 ],
			"obj-1::obj-10::obj-4::obj-197" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-1::obj-11::obj-5::obj-141" : [ "velocity range[12]", "velrange", 0 ],
			"obj-1::obj-10::obj-4::obj-199" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-1::obj-10::obj-4::obj-192" : [ "velocity range[22]", "velrange", 0 ],
			"obj-1::obj-10::obj-4::obj-2" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-1::obj-10::obj-11" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-8::obj-11::obj-134" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-1::obj-8::obj-42" : [ "live.menu[22]", "live.menu[1]", 0 ],
			"obj-1::obj-8::obj-11::obj-131" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-1::obj-10::obj-4::obj-194" : [ "velocity range[23]", "velrange", 0 ],
			"obj-1::obj-10::obj-4::obj-201" : [ "live.menu[21]", "live.menu[1]", 0 ],
			"obj-1::obj-8::obj-11::obj-132" : [ "velocity range[16]", "velrange", 0 ],
			"obj-20" : [ "live.tab[3]", "live.tab", 0 ],
			"obj-1::obj-8::obj-35" : [ "live.tab[1]", "live.tab", 0 ],
			"obj-1::obj-10::obj-179" : [ "live.menu[18]", "live.menu[1]", 0 ],
			"obj-1::obj-11::obj-25" : [ "velocity range[9]", "velrange", 0 ],
			"obj-1::obj-11::obj-5::obj-20" : [ "velocity range[1]", "velrange", 0 ],
			"obj-1::obj-11::obj-5::obj-198" : [ "velocity range[24]", "velrange", 0 ],
			"obj-1::obj-11::obj-15" : [ "live.menu[6]", "live.menu[5]", 0 ],
			"obj-1::obj-11::obj-5::obj-199" : [ "live.text[23]", "live.text[2]", 0 ],
			"obj-1::obj-11::obj-2" : [ "live.tab[2]", "live.tab", 0 ],
			"obj-1::obj-3::obj-10" : [ "live.text[15]", "live.text", 0 ],
			"obj-1::obj-3::obj-11" : [ "live.text[13]", "live.text", 0 ],
			"obj-1::obj-3::obj-6" : [ "live.text[9]", "live.text[6]", 0 ],
			"obj-1::obj-3::obj-110" : [ "live.text[17]", "live.text[6]", 0 ],
			"obj-1::obj-11::obj-5::obj-27" : [ "live.text[3]", "live.text[2]", 0 ],
			"obj-1::obj-11::obj-62" : [ "live.text[10]", "live.text[6]", 0 ],
			"obj-1::obj-11::obj-5::obj-21" : [ "velocity range[2]", "velrange", 0 ],
			"obj-1::obj-3::obj-156" : [ "live.text[20]", "live.text[6]", 0 ],
			"obj-1::obj-8::obj-22" : [ "live.tab", "live.tab", 0 ],
			"obj-1::obj-8::obj-11::obj-107" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-1::obj-11::obj-5::obj-197" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-1::obj-3::obj-7" : [ "live.text[16]", "live.text", 0 ],
			"obj-1::obj-8::obj-11::obj-98" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-1::obj-8::obj-11::obj-135" : [ "velocity range[17]", "velrange", 0 ],
			"obj-1::obj-8::obj-11::obj-50" : [ "velocity range[7]", "velrange", 0 ],
			"obj-1::obj-8::obj-11::obj-11" : [ "velocity range[5]", "velrange", 0 ],
			"obj-1::obj-10::obj-4::obj-198" : [ "velocity range[3]", "velrange", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-1::obj-10::obj-4::obj-3" : 				{
					"parameter_longname" : "velocity range[10]"
				}
,
				"obj-1::obj-10::obj-4::obj-197" : 				{
					"parameter_longname" : "live.menu[2]"
				}
,
				"obj-1::obj-10::obj-4::obj-199" : 				{
					"parameter_longname" : "live.text[2]"
				}
,
				"obj-1::obj-8::obj-42" : 				{
					"parameter_longname" : "live.menu[22]"
				}
,
				"obj-1::obj-11::obj-2" : 				{
					"parameter_longname" : "live.tab[2]"
				}
,
				"obj-1::obj-3::obj-10" : 				{
					"parameter_longname" : "live.text[15]"
				}
,
				"obj-1::obj-3::obj-110" : 				{
					"parameter_longname" : "live.text[17]"
				}
,
				"obj-1::obj-11::obj-5::obj-27" : 				{
					"parameter_longname" : "live.text[3]"
				}
,
				"obj-1::obj-3::obj-7" : 				{
					"parameter_longname" : "live.text[16]"
				}
,
				"obj-1::obj-10::obj-4::obj-198" : 				{
					"parameter_longname" : "velocity range[3]"
				}

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "ui.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-swap.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-slide-range.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "covert-to-beats.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "icon-clip.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-reflect.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-rotate.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-remove.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-anchor-start.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-anchor-mid.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-anchor-end.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-set-value.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-split.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ui-split-into.maxpat",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-none.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-fade-in.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-fade-out.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-ramp-up.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "icon-envelope-ramp-down.svg",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "zoom.js",
				"bootpath" : "D:/workspace/Max/Max-for-Live/ableton-midi-sculptor/device",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
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
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
					"fontsize" : [ 12.059008 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"bgcolor" : [ 0.117647, 0.117647, 0.117647, 1.0 ]
	}

}
