package app.controllers;

import app.models.User;
import app.repository.LogsRepository;
import app.repository.UserRepository;
import app.security.PasswordCoder;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import app.services.LogsService;
import app.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/")
public class OptionsController {
    private UserService userService;
    //    private static Logger logger = LoggerFactory.getLogger(OptionsController.class);
    private String data = null;
    private String line = "";
    private List<String> list = new ArrayList<String>();
    private LogsController logsController;

    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserRepository userRepository;

    @Autowired
    public OptionsController(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping(value = "/options/create", method = RequestMethod.POST)
    public String loginValidation(User user
            , String password, Model model
            , String login, BindingResult result
            , @RequestParam(value = "error", required = false)
                                          String error) throws NoSuchAlgorithmException {

        User personFromBd = userRepository.getLogin(login);
        if (personFromBd != null) {
            model.addAttribute("error", login);
            return "error";
        } else {
            PasswordCoder passwordCoder = new PasswordCoder(password);
            user.setPassword(String.valueOf(passwordCoder.getHashtext() + " " + passwordCoder.getHashedPassword()));
            userService.addPersons(user);
            model.addAttribute("personToPopUp", user);
//            logger.info(persons.getRegDate() + " " + persons.getFullName() + " " + "Was Created");
            return "create";
        }
    }

    @RequestMapping(value = "options/personsList")
    public String getAll(Model model) throws InterruptedException {
        List<User> personsForms = userService.getAll();
        model.addAttribute("personsList", personsForms);
        setData(String.valueOf(model));
        return "personsList";
    }

    //    @RequestMapping(value = "options/personsListLog")
//    public String getLogForSave(Model model) throws InterruptedException {
//        List<User> personsForms = userService.getAll();
//        model.addAttribute("personsList", personsForms);
//        System.out.println(personsForms);
//        setData(String.valueOf(model));
//        return "calculator";
//    }
    @GetMapping(value = "options/csv")
    public String exportToCsv(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        String fileName = "file.csv";
        String headerKey = "Content-Desposition";
        String headerValue = "attachment; filename " + fileName;
        response.setHeader(headerKey, headerValue);
        List<User> personsList = userService.getAll();

        ICsvBeanWriter csvBeanWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);

        String[] csvHeader = {"User Id", "Login", "log"};
        String[] nameMaping = {"id", "name", "logs"};

        csvBeanWriter.writeHeader(csvHeader);
        for (User user : personsList) {
            csvBeanWriter.write(user, nameMaping);
        }
        csvBeanWriter.close();
        return "personsList";
    }

    @RequestMapping(value = "options/uploadCsv")
    public void uploadCsvInDb() {
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader("src/main/resources/upload.csv"));
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split(",");
                User user = new User();
                user.setId(Long.parseLong(data[0]));
                user.setLogin(data[1]);
                user.setPassword(data[2]);
                user.setLogs(data[3]);
                userService.addPersons(user);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping(value = "options/calculator", method = RequestMethod.GET)
    public String calculator(HttpServletRequest request, Model model, String solve) {


//        userService.calculate();
        System.out.println("run");
//         solve = request.getParameter("solve");
        System.out.println(solve);
        String answer = null;
        String deal = null;
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("JavaScript");
        try {
            System.out.println(engine.eval(solve));
            answer = String.valueOf(engine.eval(solve));
            deal = (solve + " = " + answer);
            list.add(deal);
            System.out.println(list);
        } catch (
                ScriptException e) {
            e.printStackTrace();
        }
        request.setAttribute("deal", deal);
        request.setAttribute("answer", answer);
        request.setAttribute("list", list);

//
        System.out.println("deal = " + deal + "\n" + "answer = " + answer + "\n"
                + "list = " + list);
        model.addAttribute("answer", answer);
        model.addAttribute("list", list);
        List<User> personsForms = userService.getAll();
        model.addAttribute("personsList", personsForms);
        return "calculator";
    }


    @RequestMapping(value = "/options/delete{id}", method = RequestMethod.GET)
    public String removeJobform(@PathVariable("id") long id) {
        userService.removeJobForm(id);
        return "personsList";
    }

    @RequestMapping(value = "/options/edit{id}", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        Optional<User> personsList = userService.findById(id);
        model.addAttribute("personToEdit", personsList);
        return "save";
    }

    @RequestMapping(value = "/options/edit{id}", method = RequestMethod.POST)
    public String updateUser(@PathVariable("id") long id, @Valid User user
            , BindingResult result, Model model) {
        if (result.hasErrors()) {
            user.setId(id);
            return "registration";
        }
        userService.addPersons(user);
        model.addAttribute("persons", userService.getAll());
        return "personsList";

    }


    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}