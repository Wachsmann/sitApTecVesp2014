<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <title><?php echo $titulo; ?></title>
        <meta charset="UTF-8" />
        <!--<link type="text/css" rel="stylesheet" href="<?php echo base_url();?>assets/css/style.css"/>-->
    </head>
    <body>
        
        <?php echo form_open('artigo/inserir', 'id="form-artigo"'); ?>

        <label for="titulo">Título:</label><br/>
        <input type="text" name="titulo" value="<?php echo set_value('titulo'); ?>"/>
        <div class="error"><?php echo form_error('titulo'); ?></div>

        <label for="corpo">Corpo:</label><br/>
        <input type="text"  name="corpo" value="<?php echo set_value('corpo'); ?>"/>
        <div class="error"><?php echo form_error('corpo'); ?></div>
        
         <input type="text" hidden name="data" value="<?php date_default_timezone_set('America/Sao_Paulo');  $date = date('Y/m/d H:i:s'); echo $date; ?>"/>
        
        <input type="submit" name="cadastrar" value="Cadastrar" />

       

        <!-- Lista as Pessoas Cadastradas -->
        <div id="grid-artigo">
            <ul>
                <?php foreach ($artigo as $artigo): ?>
                    <li>
                        <a title="Deletar" href="<?php echo base_url() . 'artigo/deletar/' . $artigo->id; ?>" onclick="return confirm('Confirma a exclusão deste registro?')">X</a>
                        <span> - </span>
                        <a title="Editar" href="<?php echo base_url() . 'artigo/editar/' . $artigo->id; ?>"><?php echo $artigo->titulo; ?></a>
                     
                        
                    </li>
                <?php endforeach ?>
            </ul>
        </div>
        <!-- Fim Lista -->
    
        <?php?>
    </body>
</html>
