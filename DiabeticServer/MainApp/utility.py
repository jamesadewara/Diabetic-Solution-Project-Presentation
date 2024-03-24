import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import precision_score, accuracy_score
import joblib
from os import makedirs, path

class DiabeticAiPredictor():
    def __init__(self, csv_file=None):
        self.csv_file = csv_file 

    def initDataset(self):
        self.dataset = pd.read_csv(self.csv_file)
        self.y = self.dataset["Outcome"]
        self.X = self.dataset.drop("Outcome", axis=1)
        # Train-test split
        self.X_train, self.X_test, self.y_train, self.y_test = train_test_split(self.X, self.y, test_size=.2, random_state=42)


    def train(self):
        # Initialize and train the the model
        self.model = KNeighborsClassifier(n_neighbors=5)
        self.model.fit(self.X_train, self.y_train)
    
    def save(self, name="assets/diabetic_model.pkl"):
        #save the model 
        try:
            base_dir = path.basename(name)
            makedirs(base_dir)
        except:
            pass
        joblib.dump(self.model, name)

    def load(self, name="assets/diabetic_model.pkl"):
        #load the model 
        return joblib.load(name)

    def makePredictions(self, model, Pregnancies=None, Glucose=None, BloodPressure=None, SkinThickness=None, Insulin=None, BMI=None, DiabetesPedigreeFunction=None, Age=None ):
        predictions = model.predict(
            pd.DataFrame(
                {
                    "Pregnancies": [Pregnancies],
                    "Glucose": [Glucose],
                    "BloodPressure": [BloodPressure],
                    "SkinThickness": [SkinThickness],
                    "Insulin": [Insulin],
                    "BMI": [BMI],
                    "DiabetesPedigreeFunction": [DiabetesPedigreeFunction],
                    "Age": [Age],
                }
            )
        )

        return predictions
    
    def preview(self, model):
        # Model Evaluation
        y_pred = model.predict(self.X_test)
        accuracy = accuracy_score(self.y_test, y_pred)
        precision = precision_score(self.y_test, y_pred)
        return [precision, accuracy]



#test the code
if __name__ == "__main__":
    dap = DiabeticAiPredictor(csv_file="/home/adewara/Documents/Workspace/Presentations/DIABETES/DiabeticServer/MainApp/assets/germany.csv")
    dap.initDataset()
    dap.train()
    dap.save()
    score = dap.preview(dap.load())
    print("Accuracy Score:", score[1])
    print("Precision Score:", score[0])






