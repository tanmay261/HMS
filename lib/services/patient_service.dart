import 'package:flutter_auth/database/repository.dart';
import 'package:flutter_auth/models/patients.dart';

class PatientService {
  Repository _repository;
  PatientService() {
    _repository = Repository();
  }
  savePatient(Patients patient) async {
    return await _repository.save('patients', patient.patientMap());
  }

  getPatients() async {
    return await _repository.getAll('patients');
  }
}
