<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Artigo extends CI_Controller {

    function __construct() {
        parent::__construct();
        /* Carrega o modelo */
        $this->load->helper('form');
        $this->load->model('artigo_model');
    }

    function index() {
        
         if($this->session->userdata('logged_in'))
   {
     $session_data = $this->session->userdata('logged_in');
     $data['nome'] = $session_data['nome'];
     $data['titulo'] = "";
        $this->load->helper('form');
        $data['artigo'] = $this->artigo_model->listar();
        $this->load->view('home_header');
        $this->load->view('home_sidebar',$data);
        $this->load->view('artigo_view.php', $data);
   }
   else
   {
     //If no session, redirect to login page
     redirect('login', 'refresh');
   }
        
        
    }

    function inserir() {

        /* Carrega a biblioteca do CodeIgniter responsável pela validação dos formulários */
        $this->load->library('form_validation');

        /* Define as tags onde a mensagem de erro será exibida na página */
        $this->form_validation->set_error_delimiters('<span>', '</span>');

        /* Define as regras para validação */
        $this->form_validation->set_rules('titulo', 'Título', '');
        $this->form_validation->set_rules('corpo', 'Corpo', '');
    
        
       
        /* Executa a validação e caso houver erro... */
        if ($this->form_validation->run() === FALSE) {
            /* Chama a função index do controlador */
            $this->index();
            /* Senão, caso sucesso na validação... */
        } else {
            /* Recebe os dados do formulário (visão) */
            $data['titulo'] = $this->input->post('titulo');
            $data['corpo'] = $this->input->post('corpo');
            $data['data'] = $this->input->post('data');

            /* Chama a função inserir do modelo */
            if ($this->artigo_model->inserir($data)) {
                header('location: artigo');
            } else {
                log_message('error', 'Erro ao inserir o artigo.');
            }
        }
    }

    function editar($id) {
if($this->session->userdata('logged_in'))
   {
     $session_data = $this->session->userdata('logged_in');
     $data['nome'] = $session_data['nome'];
      $data['titulo'] = "CRUD com CodeIgniter | Editar Pessoa";

        /* Carrega o modelo */
        $this->load->model('artigo_model');

        /* Busca os dados da pessoa que será editada (id) */
        $data['dados_artigo'] = $this->artigo_model->editar($id);
        $this->load->view('home_header');
        $this->load->view('home_sidebar');
        /* Carrega a página de edição com os dados da pessoa */
        $this->load->view('artigo_edit', $data);
   }
   else
   {
     //If no session, redirect to login page
     redirect('login', 'refresh');
   }
        /* Aqui vamos definir o título da página de edição */
       
    }

    function atualizar() {
        /* Carrega a biblioteca do CodeIgniter responsável pela validação dos formulários */
        $this->load->library('form_validation');

        /* Define as tags onde a mensagem de erro será exibida na página */
        $this->form_validation->set_error_delimiters('<span>', '</span>');

        /* Aqui estou definindo as regras de validação do formulário, assim como 
          na função inserir do controlador, porém estou mudando a forma de escrita */
        $validations = array(
            array(
                'field' => 'titulo',
                'label' => 'Título',
                'rules' => ''
            ),
            array(
                'field' => 'corpo',
                'label' => 'Corpo',
                'rules' => ''
            ),array(
                'field' => 'data',
                'label' => 'Data',
                'rules' => ''
            )
        );
        $this->form_validation->set_rules($validations);
        
        


        /* Executa a validação... */
        if ($this->form_validation->run() === FALSE) {
            /* Caso houver erro chama função editar do controlador novamente */
            $this->editar($this->input->post('idartigo'));
        } else {
            /* Senão obtém os dados do formulário */
            $data['idartigo'] = $this->input->post('idartigo');
            $data['titulo'] = ucwords($this->input->post('titulo'));
            $data['corpo'] = ucwords($this->input->post('corpo'));
             $data['data'] = ucwords($this->input->post('data'));
            
            
            /* Carrega o modelo */
            $this->load->model('artigo_model');

            /* Executa a função atualizar do modelo passando como parâmetro os dados obtidos do formulário */
            if ($this->artigo_model->atualizar($data)) {
                /* Caso sucesso ao atualizar, recarrega a página principal */
               
                
               
                redirect('artigo');
            } else {
                /* Senão exibe a mensagem de erro */
                log_message('error', 'Erro ao atualizar a pessoa.');
            }
        }
    }

    function deletar($id) {

        /* Carrega o modelo */
        $this->load->model('artigo_model');

        /* Executa a função deletar do modelo passando como parâmetro o id da pessoa */
        if ($this->artigo_model->deletar($id)) {
            /* Caso sucesso ao atualizar, recarrega a página principal */
            redirect('artigo');
        } else {
            /* Senão exibe a mensagem de erro */
            log_message('error', 'Erro ao deletar a pessoa.');
        }
    }

}
