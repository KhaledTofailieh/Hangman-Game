package application

import javax.swing.plaf.basic.BasicBorders.ButtonBorder
import javafx.application.Application
import javafx.application.Platform
import javafx.event.ActionEvent
import javafx.event.Event
import javafx.event.EventHandler
import javafx.stage.Stage
import javafx.scene.Group
import javafx.scene.Node
import javafx.scene.Scene
import javafx.scene.control.Button
import javafx.scene.control.ButtonBase
import javafx.scene.control.CheckBox
import javafx.scene.control.CheckMenuItem
import javafx.scene.control.Label
import javafx.scene.control.Menu
import javafx.scene.control.MenuBar
import javafx.scene.control.MenuItem
import javafx.scene.control.ProgressBar
import javafx.scene.control.SeparatorMenuItem
import javafx.scene.control.TextField
import javafx.scene.image.Image
import javafx.scene.image.ImageView
import javafx.scene.input.KeyEvent
import javafx.scene.layout.AnchorPane
import javafx.scene.layout.BorderPane
import javafx.scene.layout.HBox
import javafx.scene.layout.StackPane
import javafx.scene.paint.Color
import javafx.scene.text.Font
import javafx.scene.text.Text

class Main extends Application {
	static package TextField txtf = new TextField()

	def static void main(String[] args) {
		launch(args)
	}

	package Player p1 = new Player()
	package String helpword = new String()

	override void start(Stage primaryStage) {
		var BorderPane root = new BorderPane()
		var Scene scene = new Scene(root, 500, 500)
		var AnchorPane root1 = new AnchorPane()
		var AnchorPane root2 = new AnchorPane()
		var Scene scene1 = new Scene(root1, 500, 500, Color::GREY)
		var Scene scene2 = new Scene(root2, 500, 500, Color::GREY)
		root2.setId("root2")
		var Label lab1 = new Label("")
		// menu bar
		var MenuBar Mb = new MenuBar()
		var MenuBar Mb1 = new MenuBar()
		var MenuBar Mb2 = new MenuBar()
		Mb.prefWidthProperty().bind(primaryStage.widthProperty())
		root.setTop(Mb)
		// menu :game
		var Menu game = new Menu("Game")
		var MenuItem newgame = new MenuItem("New Game")
		var MenuItem Exitgame = new MenuItem("Exit")
		Exitgame.setOnAction([ActionEvent|Platform::exit()])
		game.getItems().addAll(newgame, Exitgame, new SeparatorMenuItem())
		// Player menu 
		var Menu player = new Menu("Player")
		var CheckMenuItem one = new CheckMenuItem("Single Player")
		player.getItems().addAll(one)
		// level menu
		var Menu level = new Menu("Level")
		var CheckMenuItem Easy = new CheckMenuItem("Easy")
		var CheckMenuItem Hard = new CheckMenuItem("Hard")
		// Easy Action
		Easy.setOnAction(([ ActionEvent arg0 |
			Hard.setSelected(false)
			helpword = p1.StartEasyGame()
			lab1.setText(helpword)
			lab1.setDisable(true)
		] as EventHandler<ActionEvent>))
		// Hard Action
		Hard.setOnAction(([ ActionEvent arg0 |
			Easy.setSelected(false)
			helpword = p1.StartHardGame()
			lab1.setText(helpword)
			lab1.setDisable(true)
		] as EventHandler<ActionEvent>))
		newgame.setOnAction(([ ActionEvent arg0 |
			Easy.setSelected(false)
			Hard.setSelected(false)
			primaryStage.setScene(scene)
		] as EventHandler<ActionEvent>))
		// primaryStage.show();
		level.getItems().addAll(Easy, Hard)
		Mb.getMenus().addAll(game, player, level)
		Mb1.getMenus().add(game)
		Mb2.getMenus().add(game)
		// button and image
		var Image img = new Image(getClass().getResourceAsStream("hungman.jpg"))
		var ImageView imgview = new ImageView(img)
		imgview.setX(60)
		imgview.setY(100)
		root.getChildren().add(imgview)
		// buttons Check Button
		var Button startbtn = new Button("Start Game")
		var Button checkbtn = new Button("->")
		checkbtn.setLayoutX(222)
		checkbtn.setLayoutY(150)
		checkbtn.setMinSize(35, 25)
		checkbtn.setDisable(true)
		/*checkbtn.setMaxSize(35, 35);
		 checkbtn.setText("->");*/
		startbtn.setMinSize(100, 55)
		var HBox buttons = new HBox()
		var HBox probar = new HBox()
		var Text txt = new Text()
		txt.setLayoutX(155)
		txt.setLayoutY(430)
		var ProgressBar pb = new ProgressBar()
		pb.setManaged(false)
		pb.setMinSize(60, 25)
		// labs
		var Label lab = new Label("")
		var Label lab4 = new Label("")
		var Label lab3 = new Label("")
		// Start Button Action
		startbtn.setOnAction(([ ActionEvent arg0 |
			if (one.isSelected() && (Hard.isSelected() || Easy.isSelected())) {
				pb.setDisable(true)
				Easy.setSelected(false)
				Hard.setSelected(false)
				txt.setText(" ")
				lab.setText("")
				lab1.setDisable(false)
				lab3.setText("")
				txtf.setDisable(false)
				primaryStage.setTitle("HungMan Game")
				// get text from text field 
				primaryStage.setScene(scene1)
				primaryStage.show()
			} else {
				txt.setText("Please Select Player And Level")
				pb.setDisable(false)
				pb.setManaged(true)
			}
		] as EventHandler<ActionEvent>))
		// creat label
		lab.setLayoutX(130)
		lab.setLayoutY(200)
		lab1.setLayoutX(130)
		lab1.setLayoutY(430)
		lab1.setId("lab1")
		lab3.setLayoutX(130)
		lab3.setLayoutY(230)
		lab4.setLayoutX(20)
		lab4.setLayoutY(200)
		var Font ff = new Font("Tomaho", 20)
		lab3.setId("lab3")
		lab.setId("lab3")
		lab4.setId("lab4")
		lab3.setFont(ff)
		lab4.setFont(ff)
		lab.setFont(ff)
		// button back 
		/*Button back=new Button("Pause");
		 * back.setLayoutX(100);
		 * back.setLayoutY(350);
		 * 
		 * //Back Action
		 * back.setOnAction(new EventHandler<ActionEvent>() {
		 * 	
		 * 	@Override
		 * 	public void handle(ActionEvent arg0) {
		 *   		
		 * 		primaryStage.setScene(scene);
		 * 		primaryStage.show();
		 * 		
		 * 	
		 * 		
		 * 	}
		 });*/
		// Check Button Action
		txtf.setOnKeyPressed(([Event arg0|checkbtn.setDisable(false)] as EventHandler<Event>))
		checkbtn.setOnAction(([ ActionEvent arg0 |
			var String s2 = p1.gethidden().toString()
			p1.MakeGusse(txtf.getText().toString().charAt(0))
			lab.setText('''The Word : «p1.gethidden().toString()»'''.toString)
			txtf.setText("")
			lab3.setText('''
Score «p1.getscore()»
Try Count «p1.getTrycount()»'''.toString)
			checkbtn.setDisable(true)
			if (p1.GetGameState() === p1.GetGameState()::playerwin) {
				lab.setText('''You Win
«helpword» : «p1.getrevaled()»'''.toString)
				checkbtn.setDisable(true)
				txtf.setDisable(true)
			} else if (p1.GetGameState() === p1.GetGameState()::playerlose) {
				primaryStage.setScene(scene2)
				primaryStage.show()
				lab4.setText('''You Lose 
«helpword» : «p1.getrevaled()»'''.toString)
				checkbtn.setDisable(true)
			}
		] as EventHandler<ActionEvent>))
		// linked all nodes
		buttons.getChildren().addAll(startbtn)
		buttons.setLayoutX(img.getWidth() - 250)
		buttons.setLayoutY(110 + img.getHeight())
		probar.setLayoutX(170)
		probar.setLayoutY(440)
		probar.getChildren().add(pb)
		txtf.setMinSize(60, 32)
		txtf.setMaxSize(90, 32)
		txtf.setLayoutX(130)
		txtf.setLayoutY(150)
		// creatlevel About
		/*	Button about=new Button("About");
		 * 	about.setMinSize(80, 40);
		 * 	HBox aboutbtn=new HBox();
		 * 	aboutbtn.setLayoutX(400);
		 * 	aboutbtn.setLayoutY(400);
		 * 	aboutbtn.getChildren().add(about);
		 * 	//creat label
		 * 	Label lab5=new Label("The Developer is :Khaled\nAli\nQusai");
		 * 	about.setOnAction(new EventHandler<ActionEvent>() {
		 * 		
		 * 		@Override
		 * 		public void handle(ActionEvent arg0) {
		 * 			primaryStage.setScene(scene3);
		 * 			primaryStage.show();
		 * 			
		 * 			
		 * 		}
		 });*/
		root1.setId("root1")
		root.getChildren().addAll(buttons, txt, probar)
		root1.getChildren().addAll(txtf, checkbtn, lab, lab1, lab3, Mb1)
		root2.getChildren().addAll(Mb2, lab4)
		scene1.getStylesheets().add(this.getClass().getResource("application.css").toExternalForm())
		scene2.getStylesheets().add(this.getClass().getResource("application.css").toExternalForm())
		primaryStage.setTitle("HungMan Game")
		primaryStage.setScene(scene)
		primaryStage.show()
	}
}
