<style>

.flip {
    margin: 5px;
    line-height: 30px;
    margin: auto;
    font-size: 16px;
    padding: 5px;
    text-align: center;
    background: #555;
    border: solid 1px #666;
    color: #ffffff;
    border-radius: 3px;
    width: 100%;
    margin-bottom: 6px;
}
.border
{
    background: beige;
}
.tab-content.all
{
    display:none;
}

.loader {
    position: relative;
    background: #ffffff url(http://cdn.sulimo.pl/media/public/admin/ajax-loader.gif) 50% 50% no-repeat;
    padding: 15px 22px;
    /* display: inline; */
    display: none;
}

.linia {
    width: 20%;
    display: inline-block;
}



</style>

{include file="loadTinyMCEFull.tpl"}

{if isset($smarty.get.a) && $smarty.get.a == "update" && $smarty.get.s == "consult"}
<h2>Edycja obiektu w kategorii {if isset($object_prop[0].obj_layer_name)}{$object_prop[0].obj_layer_name}{/if}</h2><br>
{*{edump($obj.points)}*}
{*{if !empty($obj.points)}
<h2>Ważny komunikat</h2>
{/if}*}
<div id="map" style="width:700px;height:500px; float:left; margin-right: 20px;"></div>
<input type="button" id="point_revert" class="btn btn-default" value="Cofnij ostatni krok" /><br />
Aby edytować inicjatywę na mapie należy kliknąć myszką w obszar mapy.<br>

- W przypadku pojedyńczego punktu ikonka zostanie przeniesiona na nową pozycję<br>

- W przypadku lini lub poligonu kliknięta pozycja zostanie dodana do obszaru inicjatywy<br>

- Aby usunąć punkt z mapy należy użyć przycisku cofnij<br>
<br />

<div class="form-group"> 
    <label class="col-sm-1 control-label" style="text-align: left;">Rodzaj obiektu: </label>
    <div class="col-sm-3">
            <select class="form-control input-sm" id="object_type" name="obj[type]" style="width:50%;">
                <option value="point" {if isset($obj.type) && $obj.type == 'point'}
                            selected="selected"
                        {/if}>Punkt</option>
                <option value="line" {if isset($obj.type) && $obj.type == 'line'}
                            selected="selected"
                        {/if}>Linia</option>
                <option value="polygon" {if isset($obj.type) && $obj.type == 'polygon'}
                            selected="selected"
                        {/if}>Poligon</option>
            </select>
         <span style="display:none;"><i class="fa fa-calendar"></i></span>
     </div>
</div>

<div style="clear: both; margin-bottom: 20px;"> 
</div>
<table class="table table-bordered table-hover table-list table-sortable" style="width:100%;">
        {if !empty($obj)}
        <div class="tab-content">
            
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="input_client_product_group">Status: </label>
                 <div class="col-sm-9">   
                    {if isset($all_status)}
                    <select class="form-control input-sm" id="warstwa_select" name="obj[status]" title="">
                    {foreach $all_status as $k => $value}
                        <option value="{$value}" {if $obj.status == $value}
                            selected="selected"
                        {/if} >{$translate_type[$value]}</option>
                    {/foreach}
                    </select>
                    {/if}
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="input_name">Tytuł: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="text" id="input_name" value="{if isset($obj.obj_name)}{$obj.obj_name|default:''}{/if}" name="obj[obj_name]" size="70" />
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                <label class="col-sm-3 control-label" for="input_desc">Opis przedmiotu konsultacji: </label>
                <div class="col-sm-9">
                <div class="newsItemLabel_Text" id="formated{$t}"> <div style="float:left; font-weight: bold;">Treść</div> <div style="clear:both;"></div> </div>
                <textarea style='width:100%' name="obj[obj_desc]" id="input_desc" class="editor t" >{$obj.obj_desc|default:''}</textarea>
                {literal}<script type="text/javascript">loadTinyMCE('input_desc', 628, '{/literal}{$cfg.url.domain}{literal}');</script>{/literal}
                </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="input_client_product_group">Metoda: </label>
                 <div class="col-sm-9">   
                    {if isset($layers_list)}
                    <select class="form-control input-sm" id="warstwa_select" name="obj[layer_id]" title="">
                    {foreach $layers_list as $k => $layer}
                        <option value="{$layer.id}" {if $obj.layer_id == $layer.id}
                            selected="selected"
                        {/if} >{$layer.name}</option>
                    {/foreach}
                    </select>
                    {/if}
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
                   {* {edump($event_list)}*}
                     
            <div class="form-group"> 
                <label class="col-sm-3 control-label">Kategoria: </label>
                <div class="col-sm-9">
                        <select class="form-control input-sm" id="category" name="obj[category]" style="width:50%;">
                            <option value="inwestycje" {if isset($obj.category) && $obj.category == "inwestycje"} selected="selected" {/if}>Inwestycje</option>
                            <option value="sprawy_spoleczne" {if isset($obj.category) && $obj.category == "sprawy_spoleczne"} selected="selected" {/if}>Sprawy społeczne</option>
                            <option value="sprawy_solectw" {if isset($obj.category) && $obj.category == "sprawy_solectw"} selected="selected" {/if}>Sprawy sołectw</option>
                            <option value="sport" {if isset($obj.category) && $obj.category == "sport"} selected="selected" {/if}>Sport</option>
                            <option value="edukacja" {if isset($obj.category) && $obj.category == "edukacja"} selected="selected" {/if}>Edukacja</option>
                            <option value="zdrowie" {if isset($obj.category) && $obj.category == "zdrowie"} selected="selected" {/if}>Zdrowie</option>
                            <option value="infrastruktura" {if isset($obj.category) && $obj.category == "infrastruktura"} selected="selected" {/if}>Infrastruktura</option>
                            <option value="wydarzenia_gminne" {if isset($obj.category) && $obj.category == "wydarzenia_gminne"} selected="selected" {/if}>Wydarzenia gminne</option>
                            <option value="planowanie_przestrzenne" {if isset($obj.category) && $obj.category == "planowanie_przestrzenne"} selected="selected" {/if}>Planowanie przestrzenne</option>
                        </select>
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="data_od">Data od: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="date" id="data_od" value="{if isset($obj.data_od)}{$obj.data_od|default:''}{/if}" name="obj[data_od]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="data_do">Data do: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="date" id="data_do" value="{if isset($obj.data_do)}{$obj.data_do|default:''}{/if}" name="obj[data_do]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="inicjator">Inicjator konsultacji: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="text" id="inicjator" value="{if isset($obj.inicjator)}{$obj.inicjator|default:'Gmina Płużnica'}{/if}" name="obj[inicjator]" size="70" />
                    {* <select class="form-control input-sm" id="inicjator" name="obj[inicjator]" style="width:50%;">
                            <option value="{$user_name}" {if isset($obj.inicjator) && $obj.inicjator == $user.name} selected="selected" {/if}>{$user_name}</option>
                            {if $obj.user_id != NULL && $obj.user_name != NULL && $obj.user_name != $user_name}<option value="{$obj.user_name}" {if isset($obj.inicjator) && $obj.inicjator == $obj.user_name} selected="selected" {/if}>{$obj.user_name}</option>{/if}
                    </select> *}
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            {* <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="email">E-mail: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="email" id="email" value="{if isset($obj.email)}{$obj.email|default:''}{/if}" name="obj[email]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div> *}
            {* <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="phone">Telefon kontaktowy: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="tel" id="phone" value="{if isset($obj.phone)}{$obj.phone|default:''}{/if}" name="obj[phone]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div> *}
            <div class="form-group"> 
                <div id="foto-container" class="foto-container">
                    <div style="clear: both"></div>
                    <label class="col-sm-3 control-label" for="input_file">Dodaj załącznik: </label>
                    <div class="col-sm-9 single_upload">
                        <div class="col-sm-5">
                            <div class="form-group fileuploader-container">
                                    <div class="fileuploader">Wyślij</div>
                                    <div class="error_fileuploader" style="display:none;"></div>
                            </div>
                        </div>
                        <a href="{if !empty($obj.file)}{$cfg.domain.domain_media_cdn}/media/consult/{$cfg.domain.domain_name_naked}/layer/{$obj.file}{/if}" rel="nofollow" class="btn btn-info" style="{if empty($obj.file)}display:none;{else}display: inline-block; margin-left: 10px;{/if}">Pobierz załącznik</a>
                        <div class="uploaded_image">
                            <input type="hidden" name="obj[file]" id="input_file" value="">
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
             {*{edump($obj)}*}
            <div id="questions">
                {foreach $questions_list as $k => $quest}
                    <div class="form-group quest"> 
                         <label class="col-sm-3 control-label qc" id="{$k + 1}">Pytanie otwarte {$k + 1}: <a href="/cms.php#m=consult&s=consult&a=update&id={$quest.consult_id}&quest=del_quest&id_quest={$quest.question_id}" title="Usuń pytanie" style="color:red;font-size:20px;margin-left:5px;" onclick="return confirm('Czy na pewno chcesz usunąć te pytanie?');"><i class="fa fa-times-circle"></i></a><br />
                            Pytanie otwarte, to pytanie do którego użytkownicy mogą udzielać wielu różnych odpowiedzi.
                            <div class="clear"></div></label>
                         <div class="col-sm-9">  
                            {* <input class="form-control" style="width:25px;margin-right:10px;height:25px;float:left;" type="checkbox" id="add_question" value="" name="obj[add_question]" size="70" /> *}
                            <input class="form-control" type="hidden" value="{if isset($quest.question_id)}{$quest.question_id|default:''}{/if}" name="que[{$k}][id]" size="70" />
                            <input class="form-control" type="text" id="{$quest.question_id}" value="{if isset($quest.question_content)}{$quest.question_content|default:''}{/if}" name="que[{$k}][content]" size="70" />
                            
                         </div>
                    </div>
                {/foreach}
            </div>
            <div class="form-group add_quest"> 
                 <label class="col-sm-3 control-label">Dodaj pytanie otwarte: <br />
                            Pytanie otwarte, to pytanie do którego użytkownicy mogą udzielać wielu różnych odpowiedzi.
                 </label>
                 <div class="col-sm-9">  
                    <input class="btn btn-danger btn-sm panel-add" type="button" id="add_question" value="Dodaj pytanie otwarte" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>

            <div id="questions_ans">
                {foreach $questions_list_ans as $k => $quest}
                    <div class="form-group quest_ans"> 
                         <label class="col-sm-3 control-label qc_ans" id="{$k + 1}">Pytanie sondażowe {$k + 1}: <a href="/cms.php#m=consult&s=consult&a=update&id={$quest.consult_id}&quest_ans=del_quest_ans&id_quest_ans={$quest.question_id}" title="Usuń pytanie" style="color:red;font-size:20px;margin-left:5px;" onclick="return confirm('Czy na pewno chcesz usunąć te pytanie?');"><i class="fa fa-times-circle"></i></a>
                            <br />Pytanie sondażowe, to pytanie na które użytkownicy mogą odpowiedzieć tylko raz, głosując na odpowiedzi innych użytkowników albo wpisując własną odpowiedź.
                            <div class="clear"></div></label>
                         <div class="col-sm-9">  
                            <input class="form-control" style="width:25px;margin-right:10px;height:25px;float:left;" type="checkbox" value="" name="que_ans[{$k}][ans_select]" {if (isset($quest.ans_select) && $quest.ans_select==1)}checked{/if} />Odpowiedzi zamknięte (Tak, Nie, Nie wiem)
                            <br /> (Użytkownicy mają do wyboru tylko 3 odpowiedzi na które mogą głosować)
                            <input class="form-control" type="hidden" value="{if isset($quest.question_id)}{$quest.question_id|default:''}{/if}" name="que_ans[{$k}][id]" size="70" />
                            <input class="form-control" type="text" id="{$quest.question_id}" value="{if isset($quest.question_content)}{$quest.question_content|default:''}{/if}" name="que_ans[{$k}][content]" size="70" />
                         </div>
                    </div>
                {/foreach}
            </div>
            <div class="form-group add_quest_ans"> 
                 <label class="col-sm-3 control-label">Dodaj pytanie sondażowe: 
                 <br />Pytanie sondażowe, to pytanie na które użytkownicy mogą odpowiedzieć tylko raz, głosując na odpowiedzi innych użytkowników albo wpisując własną odpowiedź.</label>
                 <div class="col-sm-9">  
                    <input class="btn btn-danger btn-sm panel-add" type="button" id="add_question_ans" value="Dodaj pytanie sondażowe" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            {* {if $obj.data_do|date_format:"%Y-%m-%d" > $smarty.now|date_format:"%Y-%m-%d"}*}
           {* {edump($obj)}*}
           {if isset($obj.is_event)}
           {if  $obj.is_event=='empty'}
          
               <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="is_event">Dodaj wydarzenie: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="checkbox" id="is_event" value="{if isset($obj.is_event)}{$obj.is_event|default:''}{/if}" name="obj[is_event]" size="70" {if (isset($obj.is_event) && $obj.is_event==1)}checked{/if} />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
                   
                    {elseif $obj.is_event=='sleep'}
                         
                        <div class="form-group"> 
                             <label class="col-sm-3 control-label" for="wakeup_wydarzenie">Wznów wydarzenie: </label>
                             <div class="col-sm-9">  
                                
                                 <input class="form-control" type="checkbox" id="wakeup_wydarzenie" value="{if isset($obj.is_event)}{$obj.is_event|default:''}{/if}" name="obj[wakeup_wydarzenie]" size="70"  />
                                 <input class="form-control" type="hidden" id="wakeup_wydarzenie_h" value="{if isset($event_list)}{$obj.id}{/if}" name="obj[consult_ida]" size="20"  />
                                 <input class="form-control" type="hidden" id="wakeup_wydarzenie_f" value="{if isset($event_list)}{$obj.url}{/if}" name="obj[consult_urla]" size="20"  />

                                 <span style="display:none;"><i class="fa fa-calendar"></i></span>
                             </div>
                        </div> 
                         
                    {elseif $obj.is_event=='active'}
                        <div class="form-group"> 
                             <label class="col-sm-3 control-label" for="is_event">Usuń wydarzenie: </label>
                             <div class="col-sm-9">  
                                <input class="form-control" type="checkbox" id="delete_wydarzenie" value="{if isset($obj.is_event)}{$obj.is_event|default:''}{/if}" name="obj[delete_wydarzenie]" size="70"  />
                                <input class="form-control" type="hidden" id="delete_wydarzenie_h" value="{if isset($event_list)}{$obj.id}{/if}" name="obj[consult_id]" size="20"  />
                                <input class="form-control" type="hidden" id="flaga_wydarzenie_f" value="{if isset($event_list)}1{/if}" name="obj[flaga]" size="20"  />

                                <input class="form-control" type="hidden" id="delete_wydarzenie_f" value="{if isset($event_list)}{$obj.url}{/if}" name="obj[consult_url]" size="20"  />
                                <span style="display:none;"><i class="fa fa-calendar"></i></span>
                             </div>
                        </div>
                        <div class="form-group"> 
                             <label class="col-sm-3 control-label" for="is_event">Uśpij wydarzenie: </label>
                             <div class="col-sm-9">  
                                <input class="form-control" type="checkbox" id="standby_wydarzenie" value="{if isset($obj.is_event)}{$obj.is_event|default:''}{/if}" name="obj[standby_wydarzenie]" size="70" />
                               

                                <span style="display:none;"><i class="fa fa-calendar"></i></span>
                             </div>
                        </div>

                        <div class="form-group"> 
                             <label class="col-sm-3 control-label" for="data_wydarzenia">Data wydarzenia: </label>
                             <div class="col-sm-9">  
                                <input class="form-control" type="date" id="data_wydarzenia" value="{if isset($obj.data_wydarzenia)}{$obj.data_wydarzenia|default:''}{/if}" name="obj[data_wydarzenia]" size="70" />
                                <span style="display:none;"><i class="fa fa-calendar"></i></span>
                             </div>
                        </div>
                        <div class="form-group"> 
                             <label class="col-sm-3 control-label" for="input_location">Miejsce: </label>
                             <div class="col-sm-9">  
                                <input class="form-control" type="text" id="input_location" value="{if isset($obj.location)}{$obj.location|default:''}{/if}" name="obj[location]" size="70" />
                                 <span style="display:none;"><i class="fa fa-calendar"></i></span>
                             </div>
                        </div>
                        <div class="form-group"> 
                             <label class="col-sm-3 control-label" for="add_max_osob">Max. ilość osób: </label>
                             <div class="col-sm-9">  
                                <input class="form-control" style="width:25px;margin-right:10px;height:25px;float:left;" type="checkbox" id="add_max_osob" value="{if isset($obj.add_max_osob)}{$obj.add_max_osob|default:''}{/if}" name="obj[add_max_osob]" size="70" {if (isset($obj.add_max_osob) && $obj.add_max_osob==1)}checked{/if} />
                                <input class="form-control" style="width:calc(100% - 80px);float:left;" type="number" id="max_osob" value="{if isset($obj.max_osob)}{$obj.max_osob|default:''}{/if}" name="obj[max_osob]" size="70" /><span style="float:left;font-size:23px">&nbsp;Os.</span>
                                <span style="display:none;"><i class="fa fa-calendar"></i></span>
                             </div>
                        </div>
                        {if isset($event_list) && !empty($event_list)}
                            <div class="form-group"> 
                                 <label class="col-sm-3 control-label" for="input_location">Lista osób zapisanych ({count($event_list)}): </label>
                                 <div class="col-sm-9">
                                    {foreach $event_list as $k => $v}
                                        <span style="font-size:25px;float:left;margin-right:5px;">{$k + 1}.&nbsp;</span>
                                        <input class="form-control" type="text" style="float:left;margin-bottom:5px;cursor:default;background-color:#fff;width:25%;" id="input_list_{$k}" value="{$v['user_id']}" size="70" readonly/>
                                <a href="/cms.php#m=consult&s=consult&a=update&id={$v['consult_id']}&url={$v['url']}&user_event=delete_user&event_id={$v['event_id']}" title="Usuń z listy" style="display:block;float:left;color:red;font-size:22px;margin-left:5px;" onclick="return confirm('Czy na pewno chcesz usunąć tego użytkownika z listy wydarzenia?');"><i class="fa fa-times-circle"></i></a>
                                        <div class="clear"></div>
                                    {/foreach}
                                 </div>
                            </div>
                        {/if}
                       {/if}  
                    {/if}
                    {if $obj.is_event=='empty'}
            <div id="wydarzenie">
                <div class="form-group"> 
                     <label class="col-sm-3 control-label" for="data_wydarzenia">Data wydarzenia: </label>
                     <div class="col-sm-9">  
                        <input class="form-control" type="date" id="data_wydarzenia" value="{if isset($obj.data_wydarzenia)}{$obj.data_wydarzenia|default:''}{/if}" name="obj[data_wydarzenia]" size="70" />
                        <span style="display:none;"><i class="fa fa-calendar"></i></span>
                     </div>
                </div>
                <div class="form-group"> 
                     <label class="col-sm-3 control-label" for="input_location">Miejsce: </label>
                     <div class="col-sm-9">  
                        <input class="form-control" type="text" id="input_location" value="{if isset($obj.location)}{$obj.location|default:''}{/if}" name="obj[location]" size="70" />
                         <span style="display:none;"><i class="fa fa-calendar"></i></span>
                     </div>
                </div>
                <div class="form-group"> 
                     <label class="col-sm-3 control-label" for="add_max_osob">Max. ilość osób: </label>
                     <div class="col-sm-9">  
                        <input class="form-control" style="width:25px;margin-right:10px;height:25px;float:left;" type="checkbox" id="add_max_osob" value="{if isset($obj.add_max_osob)}{$obj.add_max_osob|default:''}{/if}" name="obj[add_max_osob]" size="70" {if (isset($obj.add_max_osob) && $obj.add_max_osob==1)}checked{/if} />
                        <input class="form-control" style="width:calc(100% - 80px);float:left;" type="number" id="max_osob" value="{if isset($obj.max_osob)}{$obj.max_osob|default:''}{/if}" name="obj[max_osob]" size="70" /><span style="float:left;font-size:23px">&nbsp;Os.</span>
                        <span style="display:none;"><i class="fa fa-calendar"></i></span>
                     </div>
                </div>
                {if isset($event_list) && !empty($event_list)}
                    <div class="form-group"> 
                         <label class="col-sm-3 control-label" for="input_location">Lista osób zapisanych ({count($event_list)}): </label>
                         <div class="col-sm-9">
                             
                            {foreach $event_list as $k => $v}
                                
                                <span style="font-size:25px;float:left;margin-right:5px;">{$k + 1}.&nbsp;</span>
                                <input class="form-control" type="text" style="float:left;margin-bottom:5px;cursor:default;background-color:#fff;width:25%;" id="input_list_{$k}" value="{$v['user_id']}" size="70" readonly/>
                                <a href="/cms.php#m=consult&s=consult&a=update&id={$v['consult_id']}&url={$v['url']}&user_event=delete_user&event_id={$v['event_id']}" title="Usuń z listy" style="display:block;float:left;color:red;font-size:22px;margin-left:5px;" onclick="return confirm('Czy na pewno chcesz usunąć tego użytkownika z listy wydarzenia?');"><i class="fa fa-times-circle"></i></a>
                                <div class="clear"></div>
                            {/foreach}
                         </div>
                    </div>
                {/if}
            </div>
            {/if}
            
           
        </div>
            
          
        <div id="point_container">
        </div>
        </table>

        {* </div> *}
        {else}
            <tr>
                <td colspan="5" style="text-align:center; padding:10px auto; font-weight:bold; "> Brak wyników wyszukiwania </td>
            </tr>
        {/if}
{/if}


{if isset($smarty.get.a) && $smarty.get.a == "create" && $smarty.get.s == "consult"}

<h2>Dodawanie konsultacji</h2><br>


<div id="map" style="width:700px;height:500px; float:left; margin-right: 20px;"></div>
{* <button  >Cofnij ostatni krok</button><br \>
<a href="#" id="point_revert" class="btn btn-default">Go to Google</a> *}
<input type="button" id="point_revert" class="btn btn-default" value="Cofnij ostatni krok" /><br />

Aby dodać inicjatywę na mapie należy kliknąć myszką w obszar mapy.<br \>

- W przypadku pojedyńczego punktu ikonka zostanie przeniesiona na nową pozycję<br \>

- W przypadku lini lub poligonu kliknięta pozycja zostanie dodana do obszaru inicjatywy<br \>

- Aby usunąć punkt z mapy należy użyć przycisku cofnij<br \>

<div style="clear: both; margin-bottom: 20px;"> 
</div>
<table class="table table-bordered table-hover table-list table-sortable" style="width:100%;">
        <div class="tab-content">
            <div class="form-group"> 
                <label class="col-sm-3 control-label">Rodzaj obiektu: </label>
                <div class="col-sm-9">
                        <select class="form-control input-sm" id="object_type" name="obj[type]" style="width:50%;">
                            <option value="point" >Punkt</option>
                            <option value="line" >Linia</option>
                            <option value="polygon" >Poligon</option>
                        </select>
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="input_name">Tytuł: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="text" id="input_name" value="" name="obj[obj_name]" size="70" />
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                <label class="col-sm-3 control-label" for="input_desc">Opis przedmiotu konsultacji: </label>
                <div class="col-sm-9">
                <div class="newsItemLabel_Text" id="formated{$t}"> <div style="float:left; font-weight: bold;">Treść</div> <div style="clear:both;"></div> </div>
                <textarea style='width:100%' name="obj[obj_desc]"   id="input_desc" class="editor t" placeholder="" ></textarea>
                {literal}<script type="text/javascript">loadTinyMCE('input_desc', 628, '{/literal}{$cfg.url.domain}{literal}');</script>{/literal}
                </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="input_client_product_group">Metoda: </label>
                 <div class="col-sm-9">   
                    {if isset($layers_list)}
                    <select class="form-control input-sm" id="warstwa_select" name="obj[layer_id]" title="">
                    {foreach $layers_list as $k => $layer}
                        <option value="{$layer.id}" >{$layer.name}</option>
                    {/foreach}
                    </select>
                    {/if}
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                <label class="col-sm-3 control-label">Kategoria: </label>
                <div class="col-sm-9">
                
                        <select class="form-control input-sm" id="category" name="obj[category]" style="width:50%;">
                            <option value="inwestycje">Inwestycje</option>
                            <option value="sprawy_spoleczne">Sprawy społeczne</option>
                            <option value="sprawy_solectw">Sprawy sołectw</option>
                            <option value="sport">Sport</option>
                            <option value="edukacja">Edukacja</option>
                            <option value="zdrowie">Zdrowie</option>
                            <option value="infrastruktura">Infrastruktura</option>
                            <option value="wydarzenia_gminne">Wydarzenia gminne</option>
                            <option value="planowanie_przestrzenne">Planowanie przestrzenne</option>
                        </select>
               
                
                     <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="data_od">Data od: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="date" id="data_od" value="" name="obj[data_od]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="data_do">Data do: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="date" id="data_do" value="" name="obj[data_do]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="inicjator">Inicjator konsultacji: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="text" id="inicjator" value="Gmina Płużnica" name="obj[inicjator]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            {* <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="email">E-mail: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="email" id="email" value="" name="obj[email]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div> *}
            {* <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="phone">Telefon kontaktowy: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="tel" id="phone" value="" name="obj[phone]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div> *}
            <div class="form-group"> 
                 <label class="col-sm-3 control-label" for="is_event">Dodaj wydarzenie: </label>
                 <div class="col-sm-9">  
                    <input class="form-control" type="checkbox" id="is_event" value="" name="obj[is_event]" size="70" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div id="wydarzenie">
                <div class="form-group"> 
                     <label class="col-sm-3 control-label" for="data_wydarzenia">Data wydarzenia: </label>
                     <div class="col-sm-9">  
                        <input class="form-control" type="date" id="data_wydarzenia" value="" name="obj[data_wydarzenia]" size="70" />
                        <span style="display:none;"><i class="fa fa-calendar"></i></span>
                     </div>
                </div>
                <div class="form-group"> 
                     <label class="col-sm-3 control-label" for="input_location">Miejsce: </label>
                     <div class="col-sm-9">  
                        <input class="form-control" type="text" id="input_location" value="" name="obj[location]" size="70" />
                         <span style="display:none;"><i class="fa fa-calendar"></i></span>
                     </div>
                </div>
                <div class="form-group"> 
                     <label class="col-sm-3 control-label" for="add_max_osob">Max. ilość osób: </label>
                     <div class="col-sm-9">  
                        <input class="form-control" style="width:25px;margin-right:10px;height:25px;float:left;" type="checkbox" id="add_max_osob" value="" name="obj[add_max_osob]" size="70" />
                        <input class="form-control" style="width:calc(100% - 80px);float:left;" type="number" id="max_osob" value="" name="obj[max_osob]" size="70" /><span style="float:left;font-size:23px">&nbsp;Os.</span>
                        <span style="display:none;"><i class="fa fa-calendar"></i></span>
                     </div>
                </div>
            </div>
            <div class="form-group"> 
                <div id="foto-container" class="foto-container">
                    <div style="clear: both"></div>
                    <label class="col-sm-3 control-label" for="input_file">Dodaj załącznik: </label>
                    <div class="col-sm-9 single_upload">
                        <div class="col-sm-5">
                            <div class="form-group fileuploader-container">
                                    <div class="fileuploader">Wyślij</div>
                                    <div class="error_fileuploader" style="display:none;"></div>
                            </div>
                        </div>
                        <a href="" rel="nofollow" class="btn btn-info" style="display:none;margin-left: 10px;">Pobierz załącznik</a>
                        <div class="uploaded_image">
                            <input type="hidden" name="obj[file]" id="input_file" value="">
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
            <div id="questions">
                <div class="form-group quest"> 
                </div>
            </div>
            <div class="form-group add_quest"> 
                 <label class="col-sm-3 control-label">Dodaj pytanie otwarte: <br />
                            Pytanie otwarte, to pytanie do którego użytkownicy mogą udzielać wielu różnych odpowiedzi.
                 </label>
                 <div class="col-sm-9">  
                    <input class="btn btn-danger btn-sm panel-add" type="button" id="add_question" value="Dodaj pytanie otwarte" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
            <div id="questions_ans">
                <div class="form-group quest_ans"> 
                </div>
            </div>
            <div class="form-group add_quest_ans"> 
                 <label class="col-sm-3 control-label">Dodaj pytanie sondażowe: 
                 <br />Pytanie sondażowe, to pytanie na które użytkownicy mogą odpowiedzieć tylko raz, głosując na odpowiedzi innych użytkowników albo wpisując własną odpowiedź.</label>
                 <div class="col-sm-9">  
                    <input class="btn btn-danger btn-sm panel-add" type="button" id="add_question_ans" value="Dodaj pytanie sondażowe" />
                    <span style="display:none;"><i class="fa fa-calendar"></i></span>
                 </div>
            </div>
        </div>
        <div id="point_container">
        </div>
    
        



{/if}

    {literal}
        <script type="text/javascript">
            $(document).ready(function() {      
                if ($("#is_event").is(":checked"))
                    $("#wydarzenie").show();
                else
                    $("#wydarzenie").hide();
                $("#is_event").change(function(){
                    $("#wydarzenie").toggle();
                });

                $("#add_question").click(function(){

                    $qc = $("#questions .quest:last-child").children(".qc").attr("id");
                    if ($qc == undefined)
                    {
                        $qc =0;
                    }
                    $qc2 = parseInt($qc) + 1;
                    $qc3 = parseInt($qc2) - 1;
                    $("#questions").append('<div class="form-group quest" id="cont_ans_open'+$qc2+'">\n\
                        <label class="col-sm-3 control-label qc" id="'+$qc2+'">Pytanie otwarte '+$qc2+': <a href="javascript:void(0)" id="ans_open'+$qc2+'" title="Usuń pytanie" class="ans_open" style="color:red;font-size:20px;margin-left:5px;"><i class="fa fa-times-circle"></i></a>\n\
                            <br />Pytanie otwarte, to pytanie do którego użytkownicy mogą udzielać wielu różnych odpowiedzi.\n\
                            <div class="clear"></div></label>\n\
                         <div class="col-sm-9">\n\
                            <input class="form-control" type="hidden" value="" name="que['+$qc3+'][id]" />\n\
                            <input class="form-control" type="text" value="" name="que['+$qc3+'][content]" />\n\
                            <span style="display:none;"><i class="fa fa-calendar"></i></span>\n\
                         </div>\n\
                    </div>');
                    $("#ans_open"+$qc2).click(function(){
                        $qt_ids = $(this).attr("id");
                        if (confirm("Czy na pewno chcesz usunąć te pytanie?") == true)
                        {
                            $("#questions").find('div#cont_'+$qt_ids).remove();
                        }
                    });
                });

                $("#add_question_ans").click(function(){

                    $qc_ans = $("#questions_ans .quest_ans:last-child").children(".qc_ans").attr("id");
                    if ($qc_ans == undefined)
                    {
                        $qc_ans =0;
                      
                    }
                    $qc2_ans = parseInt($qc_ans) + 1;
                    $qc3_ans = parseInt($qc2_ans) - 1;
                    $("#questions_ans").append('<div class="form-group quest_ans" id="cont_ans_close'+$qc2_ans+'">\n\
                        <label class="col-sm-3 control-label qc_ans" id="'+$qc2_ans+'">Pytanie sondażowe '+$qc2_ans+': <a href="javascript:void(0)" id="ans_close'+$qc2_ans+'" title="Usuń pytanie" class="ans_close" style="color:red;font-size:20px;margin-left:5px;"><i class="fa fa-times-circle"></i></a>\n\
                            <br />Pytanie sondażowe, to pytanie na które użytkownicy mogą odpowiedzieć tylko raz, głosując na odpowiedzi innych użytkowników albo wpisując własną odpowiedź.\n\
                            <div class="clear"></div></label>\n\
                         <div class="col-sm-9">\n\
                            <input class="form-control" style="width:25px;margin-right:10px;height:25px;float:left;" type="checkbox" value="" name="que_ans['+$qc3_ans+'][ans_select]" />\n\
                            Odpowiedzi zamknięte (Tak, Nie, Nie wiem)\n\
                            <br /> (Użytkownicy mają do wyboru tylko 3 odpowiedzi na które mogą głosować)\n\
                            <input class="form-control" type="hidden" value="" name="que_ans['+$qc3_ans+'][id]" />\n\
                            <input class="form-control" type="text" value="" name="que_ans['+$qc3_ans+'][content]" />\n\
                            <span style="display:none;"><i class="fa fa-calendar"></i></span>\n\
                         </div>\n\
                    </div>');
                    $("#ans_close"+$qc2_ans).click(function(){
                        $qt_id = $(this).attr("id");
                        if (confirm("Czy na pewno chcesz usunąć te pytanie?") == true)
                        {
                            $("#questions_ans").find('div#cont_'+$qt_id).remove();
                        }
                    });
                });
               // cms.form.save(false);
               // console.log("cms.h.implode()");
            });
        </script>
    {/literal}