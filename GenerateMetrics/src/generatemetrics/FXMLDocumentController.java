package generatemetrics;

import com.opencsv.CSVWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.security.cert.PKIXRevocationChecker;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.MenuItem;
import javafx.scene.control.SplitMenuButton;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

/**
 *
 * @author Paritosh
 */
public class FXMLDocumentController implements Initializable {

    private Label label;
    @FXML
    private AnchorPane mainAnchorPane;
    @FXML
    private TextField occurrencesOperators;
    @FXML
    private TextField lineOfCode;
    @FXML
    private TextField lineOfComment;
    @FXML
    private Button testButton;
    @FXML
    private TextField occurrencesOperands;
    @FXML
    private TextField distinctOperators;
    @FXML
    private TextField distinctOperands;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO

    }

    @FXML
    private void test(ActionEvent event) {

        // declaring variables to store distinct operators, distinct operands, total number of occurrences of operators and total number of occurrences of operands
        int n1, n2, N1, N2;

        n1 = Integer.parseInt(distinctOperators.getText());
        n2 = Integer.parseInt(distinctOperands.getText());
        N1 = Integer.parseInt(occurrencesOperators.getText());
        N2 = Integer.parseInt(occurrencesOperands.getText());

        // storing lines of code
        int loCode = Integer.parseInt(lineOfCode.getText());

        // storing lines of comment
        int loComment = Integer.parseInt(lineOfComment.getText());

        // generating lines of code an comment
        int loCodeAndComment = loCode + loComment;

        // generating Halstead's program length
        //float N = (float) (n1 * (Math.log(n1) / Math.log(2)) + n2 * (Math.log(n2) / Math.log(2)));
        float N = N1 + N2;
        // generating Halstead's vocabulary
        int n = n1 + n2;

        // generating Halstead's program volume
        float V = N * ((float) (Math.log(n) / Math.log(2) + 1e-10));

        // generating Halstead's program difficulty
        float D = (float)(n1 * N2) / (float)(n2 * 2);

        // generating Halstead's program effort
        float E = D * V;
        //float E = (float) 1.3;
        // generating Halstead's program time
        float T = E / (18);
        //float T = (float) 1.3;
        
        // change file path to where you want the resulting metrics file
        writeDataLineByLine("C:\\Users\\Paritosh\\Desktop\\attributes_program.csv", "" + E, "" + T, "" + loCode, "" + loComment, "" + loCodeAndComment);
        
        System.out.println(N);
        System.out.println(V);
        System.out.println(D);
        System.out.println(E);
        System.out.println(T);
        Stage stage = (Stage) testButton.getScene().getWindow();
        stage.close();
    }

    private void writeDataLineByLine(String filePath, String E, String T, String loCode, String loComment, String loCodeAndComment) {
        // first create file object for file placed at location 
        // specified by filepath 
        File file = new File(filePath);
        try {
            // create FileWriter object with file as parameter 
            FileWriter outputfile = new FileWriter(file);

            // create CSVWriter object filewriter object as parameter 
            CSVWriter writer = new CSVWriter(outputfile);

            // adding header to csv 
            String[] header = {"E", "T", "lOCode", "lOComment", "locCodeAndComment"};
            writer.writeNext(header);

            // add data to csv 
            String[] data1 = {"" + E, "" + T, "" + loCode, "" + loComment, "" + loCodeAndComment};
            writer.writeNext(data1);

            // closing writer connection 
            writer.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block 
            System.out.println("IOException while writing to csv file");
        }
    }

}



