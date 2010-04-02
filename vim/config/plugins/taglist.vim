" Custom settings for the taglist plugin (see ~/.ctags file)
" /regexp/replacement/[kind−spec/][flags]
map <F3> :TlistToggle<cr>
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let tlist_xml_settings = 'xml;i:id'
let tlist_xhtml_settings = tlist_xml_settings
let tlist_html_settings = tlist_xml_settings
let tlist_htmldjango_settings = tlist_xml_settings
let tlist_css_settings = 'css;s:Selectors'
let tlist_php_settings = 'php;c:class;d:constant;f:function'
let Tlist_Exit_OnlyWindow = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
